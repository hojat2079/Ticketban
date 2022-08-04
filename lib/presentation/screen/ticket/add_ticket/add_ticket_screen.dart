import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/elevated_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/home_route.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/add_ticket/bloc/add_ticket_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/add_ticket/file.dart';
import 'package:ticketban_mobile/util/extension.dart';

import 'drop_down.dart';

class AddNewTicketScreen extends StatefulWidget {
  static const String route = 'new-ticket';

  const AddNewTicketScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTicketScreen> createState() => _AddNewTicketScreenState();
}

class _AddNewTicketScreenState extends State<AddNewTicketScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  AddTicketBloc? _bloc;
  final GetIt instance = GetIt.instance;

  String _type = '';

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return HomeRoute(
      child: BlocProvider<AddTicketBloc>(
        create: (context) {
          _bloc = AddTicketBloc(instance<TicketUserRepository>());
          _bloc?.add(AddTicketStarted());
          return _bloc!;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: padding36H,
            child: BlocListener<AddTicketBloc, AddTicketState>(
              listener: (context, state) async {
                if (state is AddTicketError) {
                  context.showSnackBar(state.error.message);
                } else if (state is AddTicketCreated) {
                  Navigator.pop(context);
                  context.showSnackBar('تیکت با موفقیت ساخته شد');
                } else if (state is AddTicketSetNewType) {
                  setNewType(state.value);
                }
              },
              listenWhen: (p, c) {
                return c is AddTicketError ||
                    c is AddTicketCreated ||
                    c is AddTicketSetNewType;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH24,
                  const HomeAppBar(),
                  sizedBoxH48,
                  _largeText(themeData, 'ارسال تیکت جدید'),
                  sizedBoxH32,
                  _descriptionText(themeData, 'نوع درخواست:'),
                  sizedBoxH12,
                  DropDownTicketType(
                    onTap: (value) {
                      _bloc?.add(AddTicketChangeTypeState(value));
                    },
                  ),
                  sizedBoxH24,
                  _descriptionText(themeData, 'موضوع درخواست:'),
                  sizedBoxH12,
                  ElevatedTextField(
                    keyboardType: TextInputType.text,
                    hint: 'نوشتن موضوع درخواست...',
                    isPassword: false,
                    controller: _titleController,
                  ),
                  sizedBoxH24,
                  _descriptionText(themeData, 'متن درخواست:'),
                  sizedBoxH12,
                  ElevatedTextField(
                    keyboardType: TextInputType.text,
                    hint: 'نوشتن متن درخواست...',
                    isPassword: false,
                    maxLines: 8,
                    height: 150,
                    controller: _descController,
                  ),
                  sizedBoxH24,
                  _descriptionText(themeData, 'درج فایل'),
                  sizedBoxH12,
                  FileComponent(image: Assets.image.svg.file.svg()),
                  sizedBoxH48,
                  BlocBuilder<AddTicketBloc, AddTicketState>(
                    builder: (context, state) {
                      return state is AddTicketLoading
                          ? showLoading(themeData.colorScheme.primary)
                          : GradiantButton(
                              gradient: LightColorPalette.defaultOkButton,
                              onTap: () {
                                _createTicket(context);
                              },
                              label: 'ارسال',
                              icon: Assets.image.svg.send.svg(width: 18),
                              textStyle: themeData.textTheme.button,
                              height: homeButtonSizeHeight,
                              width: homeButtonSizeWidth,
                              borderRadius: circular18,
                            );
                    },
                  ),
                  sizedBoxH32,
                  const SizedBox(
                    height: HomeRoute.bottomNavHeight -
                        HomeRoute.bottomNavContainerHeight,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _largeText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline2,
    );
  }

  Widget _descriptionText(ThemeData themeData, String text) {
    return Padding(
      padding: padding4R,
      child: Text(
        text,
        style: themeData.textTheme.subtitle2,
      ),
    );
  }

  void _createTicket(BuildContext context) {
    context.read<AddTicketBloc>().add(
          AddTicketSubmitButtonClicked(
              _titleController.text, _descController.text, _type),
        );
  }

  void setNewType(String type) {
    _type = type;
  }
}
