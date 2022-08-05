import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';
import 'package:ticketban_mobile/presentation/component/widget/small_widget.dart';
import 'package:ticketban_mobile/presentation/screen/auth/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth_root.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/auth/forget_password_screen.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_screen.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'package:ticketban_mobile/util/extension.dart';

class LoginScreen extends StatefulWidget {
  static const String headText = 'ورود';
  static const String route = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return AuthRoot(
      appbar: _appbar(),
      child: _loginContainer(themeData, size),
    );
  }

  Widget _titleContainer(ThemeData themeData) {
    //rich text for handle multiple text with diff style
    return RichText(
      text: TextSpan(children: [
        const TextSpan(text: 'به '),
        WidgetSpan(
          child: GradientText(
            'تیکت بان',
            gradient: LightColorPalette.defaultTextGradiant,
            style: themeData.textTheme.headline4,
          ),
          baseline: TextBaseline.ideographic,
        ),
        const TextSpan(
          text: ' خوش آمدید',
        ),
      ], style: themeData.textTheme.headline4),
    );
  }

  Widget _appbar() {
    return AppBarAuth(
      gradient: LightColorPalette.registerButtonTextGradiant,
      text: 'ثبت نام',
      onTap: () {
        _onTapRegisterButton();
      },
    );
  }

  void _onTapRegisterButton() {
    context.read<AuthBloc>().add(AuthRegisterButtonClickedInLoginPage());
  }

  Widget _loginContainer(ThemeData themeData, Size size) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthSuccess ||
            current is AuthErrorState ||
            current is AuthRegister ||
            current is AuthForgetPassword;
      },
      listener: (context, state) {
        if (state is AuthErrorState) {
          context.showSnackBar(state.error.message);
        } else if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, HomeScreen.route);
        } else if (state is AuthRegister) {
          Navigator.of(context).pushNamed(RegisterScreen.route);
        } else if (state is AuthForgetPassword) {
          Navigator.of(context).pushNamed(ForgetPasswordScreen.route);
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

              //title login container
              _titleContainer(themeData),

              sizedBoxH24,

              //phone textField
              CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hint: 'شماره تلفن',
                prefixIcon: _startPhoneIcon(),
                maxLength: 11,
              ),

              sizedBoxH16,

              //password textField
              CustomTextField(
                controller: _passwordController,
                hint: 'رمز عبور',
                isPassword: true,
                prefixIcon: _startPasswordIcon(),
                suffixIcon: _endPasswordIcon(themeData),
              ),
              sizedBoxH24,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //this widget for symmetric row used.
                  Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: _forgetPasswordText(themeData),
                  ),

                  //for handle change state with bloc pattern used.
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (previous, current) {
                      return current is AuthLoading ||
                          current is AuthErrorState;
                    },
                    builder: (context, state) {
                      return state is AuthLoading
                          ?
                          //show loading after click this button
                          showLoading(themeData.colorScheme.primary)
                          :
                          //submit button
                          GradiantButton(
                              gradient:
                                  LightColorPalette.loginButtonTextGradiant,
                              onTap: () {
                                _onTapLoginButton(context);
                              },
                              label: LoginScreen.headText,
                              textStyle: themeData.textTheme.button,
                            );
                    },
                  ),

                  //button for navigate to forget password screen
                  TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              const AuthForgetPasswordClicked(),
                            );
                      },
                      child: _forgetPasswordText(themeData)),
                ],
              ),
              sizedBoxH24,
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthLoginClicked(
            password: _passwordController.text,
            phone: _phoneController.text,
          ),
        );
  }

  Widget _forgetPasswordText(ThemeData themeData) {
    return Text(
      'فراموشی رمز عبور',
      style: themeData.textTheme.bodyText2!
          .apply(color: themeData.colorScheme.primary, fontSizeFactor: 0.85),
    );
  }

  Widget _startPasswordIcon() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.password.svg(width: 24),
    );
  }

  Widget _startPhoneIcon() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.phone.svg(width: 24),
    );
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
