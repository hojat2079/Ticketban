import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';
import 'package:ticketban_mobile/presentation/screen/auth/bloc/auth_bloc.dart';

class LoginContainer extends StatefulWidget {
  static const String headText = 'ورود';

  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController _passwordController =
      TextEditingController(text: '777737777');
  final TextEditingController _phoneController =
      TextEditingController(text: '09338503698');

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
    return Container(
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
            RichText(
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
            ),
            sizedBoxH24,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Text(
                    'فراموشی رمز عبور',
                    style: themeData.textTheme.bodyText2!.apply(
                        color: themeData.colorScheme.primary,
                        fontSizeFactor: 0.85),
                  ),
                ),
                GradiantButton(
                  gradient: LightColorPalette.loginButtonTextGradiant,
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLoginClicked(
                          password: _passwordController.text,
                          phone: _phoneController.text,
                        ));
                  },
                  label: LoginContainer.headText,
                  textStyle: themeData.textTheme.button,
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          const AuthForgetPasswordClicked(),
                        );
                  },
                  child: Text(
                    'فراموشی رمز عبور',
                    style: themeData.textTheme.bodyText2!.apply(
                        color: themeData.colorScheme.primary,
                        fontSizeFactor: 0.85),
                  ),
                ),
              ],
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }
}
