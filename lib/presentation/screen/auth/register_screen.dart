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
import 'package:ticketban_mobile/presentation/screen/auth/otp_screen.dart';
import 'package:ticketban_mobile/util/extension.dart';

class RegisterScreen extends StatefulWidget {
  static const String headText = 'ثبت نام';
  static const String route = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      appbar: _appBar(context),
      child: _registerContainer(size, themeData),
    );
  }

  Widget _registerContainer(Size size, ThemeData themeData) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthErrorState ||
            current is AuthLogin ||
            current is AuthOtp;
      },
      listener: (context, state) {
        if (state is AuthErrorState) {
          context.showSnackBar(state.error.message);
        } else if (state is AuthLogin) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (state is AuthOtp) {
          Navigator.of(context).pushNamed(OtpScreen.routeAfterRegister);
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

              //title register container
              _titleContainer(themeData),

              sizedBoxH24,

              //name textField
              CustomTextField(
                controller: _nameController,
                hint: 'نام و نام خانوادگی',
                prefixIcon: _startNameContainer(),
              ),

              sizedBoxH16,

              //phone textField
              CustomTextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hint: 'شماره تلفن',
                prefixIcon: _startPhoneContainer(),
                maxLength: 11,
              ),

              sizedBoxH16,

              //password textField
              CustomTextField(
                  controller: _passwordController,
                  hint: 'رمز عبور',
                  isPassword: true,
                  prefixIcon: _startPasswordContainer(),
                  suffixIcon: _endPasswordIcon(themeData)),

              sizedBoxH24,

              //for handle change state with bloc pattern used.
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) {
                  return current is AuthLoading || current is AuthErrorState;
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
                              LightColorPalette.registerButtonTextGradiant,
                          onTap: () {
                            _onTapRegisterButton(context);
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
    );
  }

  void _onTapRegisterButton(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthRegisterClicked(
            name: _nameController.text,
            password: _passwordController.text,
            phone: _phoneController.text,
          ),
        );
  }

  Widget _startPasswordContainer() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.password.svg(width: 24),
    );
  }

  Widget _startPhoneContainer() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.phone.svg(width: 24),
    );
  }

  Widget _startNameContainer() {
    return Padding(
      padding: paddingSuffixIcon,
      child: Assets.image.svg.person.svg(width: 24),
    );
  }

  Widget _titleContainer(ThemeData themeData) {
    return Text(
      RegisterScreen.headText,
      style: themeData.textTheme.headline4,
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBarAuth(
      gradient: LightColorPalette.loginButtonTextGradiant,
      text: 'ورود',
      onTap: () {
        _onTapLoginClicked(context);
      },
    );
  }

  void _onTapLoginClicked(BuildContext context) {
    context.read<AuthBloc>().add(const AuthLoginButtonClickedInRegisterPage());
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
