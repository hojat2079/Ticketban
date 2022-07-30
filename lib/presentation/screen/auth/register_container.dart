import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';

class RegisterContainer extends StatelessWidget {
  static const String headText = 'ثبت نام';

  const RegisterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
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
            CustomTextField(
              hint: 'نام و نام خانوادگی',
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.person.svg(),
              ),
            ),
            sizedBoxH16,
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
            GradiantButton(
              gradient: LightColorPalette.registerButtonTextGradiant,
              onTap: () {},
              label: headText,
              textStyle: themeData.textTheme.button,
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }
}
