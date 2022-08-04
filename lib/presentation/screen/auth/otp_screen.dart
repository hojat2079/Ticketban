import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/auth/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth_root.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_screen.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'package:ticketban_mobile/util/extension.dart';

class OtpScreen extends StatefulWidget {
  final String title;
  final String desc;
  static const Color endButtonColor = Color(0xff2872FB);
  static const String routeAfterRegister = '/otp-register';
  static const String routeAfterForgetPassword = '/otp-forget-password';

  const OtpScreen({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return AuthRoot(
      appbar: AppBarAuth(
        gradient: LightColorPalette.loginButtonTextGradiant,
        text: 'ورود',
        onTap: () {
          context
              .read<AuthBloc>()
              .add(const AuthLoginButtonClickedInRegisterPage());
        },
      ),
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (previous, current) {
          return current is AuthErrorState ||
              current is AuthLogin ||
              current is AuthSuccess ||
              current is AuthCancelTimer;
        },
        listener: (context, state) {
          if (state is AuthErrorState) {
            context.showSnackBar(state.error.message);
          } else if (state is AuthSuccess) {
            _navigateToHomePage(context);
          } else if (state is AuthCancelTimer) {
            _cancelTimer();
          } else if (state is AuthLogin) {
            _navigateToLoginPage(context);
          }
        },
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: themeData.colorScheme.surface,
            borderRadius: circular32,
          ),
          child: Padding(
            padding: padding32H,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxH20,
                _titleText(themeData),
                sizedBoxH24,
                Text(
                  widget.desc,
                  style: themeData.textTheme.bodyText2!
                      .apply(fontSizeFactor: 0.95),
                ),
                sizedBoxH24,
                CustomTextField(
                  controller: _otpController,
                  keyboardType: TextInputType.phone,
                  hint: 'کد اعتبارسنجی ۶ رقمی',
                  prefixIcon: Padding(
                    padding: paddingSuffixIcon,
                    child: Assets.image.svg.password.svg(),
                  ),
                  suffixIcon: BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) {
                      return current is AuthDecreaseTimer ||
                          current is AuthCancelTimer;
                    },
                    builder: (context, state) {
                      return state is AuthCancelTimer
                          ? _endButton(themeData)
                          : sizedBox0;
                    },
                  ),
                  maxLength: 4,
                ),
                sizedBoxH16,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (p, c) {
                    return c is AuthDecreaseTimer ||
                        c is AuthCancelTimer ||
                        c is AuthOtp;
                  },
                  builder: (context, state) {
                    return Text(
                      state is AuthDecreaseTimer
                          ? state.timer.toFormatStandardTimeInApp()
                          : state is AuthOtp
                              ? AuthOtp.startTimer.toFormatStandardTimeInApp()
                              : 0.toFormatStandardTimeInApp(),
                      style: themeData.textTheme.bodyText2!.apply(
                        color: themeData.colorScheme.primaryContainer,
                        fontSizeFactor: 0.85,
                      ),
                    );
                  },
                ),
                sizedBoxH24,
                BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: (previous, current) {
                    return current is AuthLoading || current is AuthErrorState;
                  },
                  builder: (context, state) {
                    return state is AuthLoading
                        ? showLoading(themeData.colorScheme.primary)
                        : GradiantButton(
                            gradient:
                                LightColorPalette.registerButtonTextGradiant,
                            onTap: () {
                              context
                                  .read<AuthBloc>()
                                  .add(AuthOtpClicked(_otpController.text));
                            },
                            label: 'تایید و ورود',
                            textStyle: themeData.textTheme.button!.apply(
                              fontSizeFactor: 0.9,
                            ),
                          );
                  },
                ),
                sizedBoxH24,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _titleText(ThemeData themeData) {
    return Text(
      widget.title,
      style: themeData.textTheme.headline4,
    );
  }

  Widget _endButton(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            OtpScreen.endButtonColor,
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: circular14,
            ),
          ),
          minimumSize: MaterialStateProperty.all(size0),
          padding: MaterialStateProperty.all(padding8H),
        ),
        onPressed: () {
          //TODO()
        },
        child: Text(
          'ارسال مجدد',
          style: themeData.textTheme.bodyText2!.apply(
              color: themeData.colorScheme.onSecondary, fontSizeFactor: 0.75),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        context.read<AuthBloc>().add(AuthAfterOneSecond());
      },
    );
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  void _navigateToHomePage(BuildContext context) {
    //fix
    Navigator.of(context)
        .pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
