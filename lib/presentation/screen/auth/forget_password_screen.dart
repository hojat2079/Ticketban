import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const headText = 'فراموشی رمز عبور';
  static const route = '/forget-password';
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordController.dispose();
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
            Text(
              ForgetPasswordScreen.headText,
              style: themeData.textTheme.headline4,
            ),
            sizedBoxH24,
            const Text('شماره تلفن خود را جهت ارسال کد بازیابی وارد کنید'),
            sizedBoxH24,
            CustomTextField(
              controller: _passwordController,
              keyboardType: TextInputType.phone,
              hint: 'شماره تلفن',
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.phone.svg(width: 24),
              ),
              maxLength: 11,
            ),
            sizedBoxH36,
            GradiantButton(
              gradient: LightColorPalette.registerButtonTextGradiant,
              onTap: () {},
              label: 'ارسال کد',
              textStyle: themeData.textTheme.button,
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }
}
