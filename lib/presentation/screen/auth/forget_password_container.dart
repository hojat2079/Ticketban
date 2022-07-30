import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';

class ForgetPasswordContainer extends StatelessWidget {
  static const headText = 'فراموشی رمز عبور';
  const ForgetPasswordContainer({Key? key}) : super(key: key);

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
              headText,
              style: themeData.textTheme.headline4,
            ),
            sizedBoxH24,
            const Text('شماره تلفن خود را جهت ارسال کد بازیابی وارد کنید'),
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
