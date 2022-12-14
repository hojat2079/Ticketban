import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/change_password/bloc/change_password_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/home_route.dart';
import 'package:ticketban_mobile/util/extension.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String route = 'ch-pass';
  static const String head = 'تغییر کلمه عبور';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GetIt instance = GetIt.instance;
  final TextEditingController _currentPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmNewPassword = TextEditingController();

  @override
  void dispose() {
    _confirmNewPassword.dispose();
    _currentPassword.dispose();
    _newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return HomeRoute(
      child: BlocProvider<ChangePasswordBloc>(
        create: (context) => ChangePasswordBloc(
          instance<AuthRepository>(),
        )..add(ChangePasswordStarted()),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: padding36H,
            child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
              listenWhen: (p, c) =>
                  c is ChangePasswordSuccess || c is ChangePasswordError,
              listener: (context, state) {
                if (state is ChangePasswordSuccess) {
                  //after success password changed
                  passwordChanged(context, 'رمز عبور با موفقیت تغییر کرد');
                } else if (state is ChangePasswordError) {
                  //after emit error state
                  passwordNoChanged(context, state.error.message);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH24,

                  //appBar
                  const HomeAppBar(),

                  sizedBoxH48,

                  //titleText
                  _largeText(themeData, 'تغییر کلمه عبور'),

                  sizedBoxH32,

                  //hint currentPassword
                  _descriptionText(themeData, 'کلمه عبور فعلی را وارد کنید:'),

                  sizedBoxH12,

                  //currentPassword TextField
                  CustomTextField(
                    hint: 'کلمه عبور فعلی:',
                    controller: _currentPassword,
                    isPassword: true,
                    prefixIcon: Padding(
                      padding: paddingSuffixIcon,
                      child: Assets.image.svg.passwordItem.svg(width: 24),
                    ),
                    suffixIcon: _endPasswordIcon(themeData),
                  ),

                  sizedBoxH24,

                  //hint newPassword
                  _descriptionText(themeData, 'کلمه عبور جدید را وارد کنید:'),

                  sizedBoxH12,

                  //newPassword TextField
                  CustomTextField(
                    hint: 'کلمه عبور جدید:',
                    controller: _newPassword,
                    prefixIcon: _prefixIconNewPassword(),
                    isPassword: true,
                    suffixIcon: _endPasswordIcon(themeData),
                  ),
                  sizedBoxH24,

                  //hint confirmCurrentPassword
                  _descriptionText(
                    themeData,
                    'کلمه عبور جدید را مجددا وارد کنید:',
                  ),

                  sizedBoxH12,

                  //confirmNewPassword TextField
                  CustomTextField(
                    hint: 'تایید کلمه عبور جدید:',
                    controller: _confirmNewPassword,
                    prefixIcon: _prefixIconNewPassword(),
                    isPassword: true,
                    suffixIcon: _endPasswordIcon(themeData),
                  ),

                  sizedBoxH36,

                  //submit button and loading when request to api
                  BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                    buildWhen: (p, c) =>
                        c is ChangePasswordLoading || c is ChangePasswordError,
                    builder: (context, state) {
                      return state is ChangePasswordLoading
                          ?
                          //show Loading when request to server
                          showLoading(themeData.colorScheme.primary)
                          :
                          //submit button for changePassword
                          GradiantButton(
                              gradient: LightColorPalette.defaultOkButton,
                              onTap: () {
                                _submitButtonClicked(context);
                              },
                              label: 'تایید',
                              icon: Assets.image.svg.check.svg(width: 20),
                              textStyle: themeData.textTheme.button,
                              height: homeButtonSizeHeight,
                              width: homeButtonSizeWidth,
                              borderRadius: circular18,
                            );
                    },
                  ),

                  //for space with bottomNav
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

  void _submitButtonClicked(BuildContext context) {
    context.read<ChangePasswordBloc>().add(
          ChangePasswordClickSubmitButton(
            currentPass: _currentPassword.text,
            newPass: _newPassword.text,
            confirmNewPass: _confirmNewPassword.text,
          ),
        );
  }

  Widget _prefixIconNewPassword() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.lock.svg(width: 24),
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

  Widget _largeText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline2,
    );
  }

  void passwordChanged(BuildContext context, String message) {
    Navigator.pop(context);
    context.showSnackBar(message);
  }

  void passwordNoChanged(BuildContext context, String message) {
    context.showSnackBar(message);
  }

  Widget _endPasswordIcon(ThemeData themeData) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: Icon(
        Icons.visibility_off_outlined,
        color: themeData.colorScheme.onPrimary,
      ),
    );
  }
}
