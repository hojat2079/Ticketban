import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/auth/forget_password_container.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_container.dart';
import 'package:ticketban_mobile/presentation/screen/auth/otp_container.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_container.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'appbar.dart';
import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  static const String route = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: mediaQuery.size.height -
                  mediaQuery.padding.top -
                  mediaQuery.padding.bottom,
            ),
            child: Column(
              children: [
                Padding(
                  padding: padding24,
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return AppBarAuth(
                        gradient: state.isLogin
                            ? LightColorPalette.registerButtonTextGradiant
                            : LightColorPalette.loginButtonTextGradiant,
                        text: state.isLogin ? 'ثبت نام' : 'ورود',
                      );
                    },
                  ),
                ),
                sizedBoxH16,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Assets.image.png.banner.image(),
                    ),
                  ),
                ),
                sizedBoxH24,
                Padding(
                  padding: padding24H,
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthErrorState) {
                        showSnackbar(context, state.error.message);
                      } else if (state is AuthSuccess) {
                        Navigator.pushNamed(context, HomeScreen.route);
                      }
                    },
                    listenWhen: (previous, current) {
                      return current is AuthSuccess ||
                          current is AuthErrorState;
                    },
                    buildWhen: (previous, current) {
                      return current is AuthLogin ||
                          current is AuthRegister ||
                          current is AuthForgetPassword ||
                          current is AuthForgetPasswordOtp ||
                          current is AuthOtp;
                    },
                    builder: (context, state) {
                      if (state is AuthLogin) {
                        return const LoginContainer();
                      } else if (state is AuthRegister) {
                        return const RegisterContainer();
                      } else if (state is AuthForgetPassword) {
                        return const ForgetPasswordContainer();
                      } else if (state is AuthForgetPasswordOtp) {
                        return const OtpContainer(
                          title: AuthForgetPasswordOtp.title,
                          desc: AuthForgetPasswordOtp.desc,
                        );
                      } else if (state is OtpContainer) {
                        return const OtpContainer(
                          title: AuthOtp.title,
                          desc: AuthOtp.desc,
                        );
                      } else {
                        throw Exception('state is not valid.');
                      }
                    },
                  ),
                ),
                sizedBoxH24,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
