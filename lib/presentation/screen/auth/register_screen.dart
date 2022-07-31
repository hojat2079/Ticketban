import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/screen/auth/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth_root.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/otp_container.dart';
import 'package:ticketban_mobile/util/extension.dart';

class RegisterScreen extends StatefulWidget {
  static const String headText = 'ثبت نام';
  static const String route = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: 'دانیال پرندوار');
  final TextEditingController _phoneController =
      TextEditingController(text: '09382308441');
  final TextEditingController _passwordController =
      TextEditingController(text: '1234567890');

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
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
                current is AuthOtp;
          },
          listener: (context, state) {
            if (state is AuthErrorState) {
              context.showSnackBar(state.error.message);
            } else if (state is AuthLogin) {
              //fix
              // Navigator.of(context).popUntil(
              //   (route) => route.settings.name == LoginScreen.route,
              // );
              Navigator.pop(context);
            } else if (state is AuthOtp) {
              Navigator.of(context).pushNamed(OtpScreen.route);
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
                  Text(
                    RegisterScreen.headText,
                    style: themeData.textTheme.headline4,
                  ),
                  sizedBoxH24,
                  CustomTextField(
                    controller: _nameController,
                    hint: 'نام و نام خانوادگی',
                    prefixIcon: Padding(
                      padding: paddingSuffixIcon,
                      child: Assets.image.svg.person.svg(),
                    ),
                  ),
                  sizedBoxH16,
                  CustomTextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    hint: 'شماره تلفن',
                    prefixIcon: Padding(
                      padding: paddingSuffixIcon,
                      child: Assets.image.svg.phone.svg(),
                    ),
                    maxLength: 11,
                  ),
                  sizedBoxH16,
                  CustomTextField(
                    controller: _passwordController,
                    hint: 'رمز عبور',
                    isPassword: true,
                    prefixIcon: Padding(
                      padding: paddingSuffixIcon,
                      child: Assets.image.svg.password.svg(),
                    ),
                    suffixIcon: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: Icon(
                        Icons.visibility_off_outlined,
                        color: themeData.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  sizedBoxH24,
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) {
                      return current is AuthLoading ||
                          current is AuthErrorState;
                    },
                    builder: (context, state) {
                      return state is AuthLoading
                          ? showLoading(themeData.colorScheme.primary)
                          : GradiantButton(
                              gradient:
                                  LightColorPalette.registerButtonTextGradiant,
                              onTap: () {
                                context.read<AuthBloc>().add(
                                      AuthRegisterClicked(
                                        name: _nameController.text,
                                        password: _passwordController.text,
                                        phone: _phoneController.text,
                                      ),
                                    );
                              },
                              label: RegisterScreen.headText,
                              textStyle: themeData.textTheme.button,
                            );
                    },
                  ),
                  sizedBoxH24,
                ],
              ),
            ),
          ),
        ));
  }

  Widget showLoading(Color color) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}