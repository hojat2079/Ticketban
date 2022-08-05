import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/domain/repository/auth_repository.dart';
import 'package:ticketban_mobile/domain/repository/ticket_user_repository.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/change_password/change_password.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/avatar.dart';
import 'package:ticketban_mobile/presentation/screen/home/exit_dialog.dart';
import 'package:ticketban_mobile/presentation/screen/home/menu_item.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/add_ticket/add_ticket_screen.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/list_ticket_screen.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  static const String item1 = 'تیکت های شما';
  static const String item2 = 'ارسال تیکت جدید';
  static const String item3 = 'تغییر کلمه عبور';
  static const String item4 = 'خروج';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getIt = GetIt.instance;
  HomeBloc? _bloc;

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surfaceVariant,
      statusBarIconBrightness: Brightness.dark,
    ));

    //handle only portrait Screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceVariant,
      body: BlocProvider<HomeBloc>(
        create: (context) {
          _bloc = HomeBloc(
            getIt<TicketUserRepository>(),
            getIt<AuthRepository>(),
          );
          _bloc!.add(
            HomeStarted(),
          );
          return _bloc!;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (p, c) => c is HomeSuccess || c is HomeLoading,
              builder: (context, state) {
                return state is HomeLoading
                    ?
                    //show loading
                    _loading(size, themeData)
                    :
                    //content
                    Padding(
                        padding: padding36H,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            sizedBoxH24,

                            //appbar

                            const HomeAppBar(),

                            sizedBoxH24,

                            //appbar
                            const AvatarWidget(),

                            sizedBoxH12,

                            //name text
                            _nameText(
                              themeData,
                              state is HomeSuccess ? state.username : '',
                            ),

                            sizedBoxH36,

                            //item list ticket
                            CustomMenuItem(
                              icon: Assets.image.svg.myTicket.svg(),
                              text: _menuItemText(themeData, HomeScreen.item1),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ListTicketScreen.route);
                              },
                            ),

                            sizedBoxH20,

                            //item create ticket
                            CustomMenuItem(
                              icon: Assets.image.svg.allTicket.svg(),
                              text: _menuItemText(themeData, HomeScreen.item2),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AddNewTicketScreen.route);
                              },
                            ),

                            sizedBoxH20,

                            //item change password
                            CustomMenuItem(
                              icon: Assets.image.svg.passwordItem.svg(),
                              text: _menuItemText(themeData, HomeScreen.item3),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ChangePasswordScreen.route);
                              },
                            ),

                            sizedBoxH20,

                            //item exit
                            CustomMenuItem(
                              icon: Assets.image.svg.exit.svg(),
                              text: _menuItemText(themeData, HomeScreen.item4),
                              onTap: () async {
                                await showCustomDialog(
                                  context: context,
                                  title: 'آیا از خروج خود اطمینان دارید؟',
                                );
                              },
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Text _menuItemText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.subtitle1,
    );
  }

  Widget _nameText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline3,
    );
  }

  Widget _loading(Size size, ThemeData themeData) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Center(
        child: showLoading(
          themeData.colorScheme.primary,
        ),
      ),
    );
  }

  showCustomDialog({
    required BuildContext context,
    required String title,
  }) async {
    await showDialog(
      context: context,
      barrierColor: null,
      builder: (context) {
        return BlocProvider.value(
          value: _bloc!,
          child: BlocListener<HomeBloc, HomeState>(
            listenWhen: (p, c) {
              return c is HomeExitSuccess;
            },
            listener: (context, state) {
              if (state is HomeExitSuccess) {
                _backToHome(context);
              }
            },
            //for rtl layout
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BackdropFilter(
                //for blur behind screen
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: ExitDialog(
                  title: title,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.route, (route) => false);
  }
}
