import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';

class LoginContainer extends StatelessWidget {
  static const String headText = 'ورود';

  const LoginContainer({Key? key}) : super(key: key);

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
                  onTap: () {},
                  label: headText,
                  textStyle: themeData.textTheme.button,
                ),
                TextButton(
                  onPressed: () {},
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
