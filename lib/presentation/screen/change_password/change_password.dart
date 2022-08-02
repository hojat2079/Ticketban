import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String route = 'ch-pass';
  static const String head = 'تغییر کلمه عبور';

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surface,
      statusBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: padding36H,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH24,
                const HomeAppBar(),
                sizedBoxH36,
                _largeText(themeData, 'تغییر کلمه عبور'),
                sizedBoxH32,
                _descriptionText(themeData, 'کلمه عبور فعلی را وارد کنید:'),
                sizedBoxH12,
                CustomTextField(
                  hint: 'کلمه عبور فعلی:',
                  controller: null,
                  isPassword: true,
                  prefixIcon: Padding(
                    padding: paddingSuffixIcon,
                    child: Assets.image.svg.passwordItem.svg(width: 24),
                  ),
                ),
                sizedBoxH24,
                _descriptionText(themeData, 'کلمه عبور جدید را وارد کنید:'),
                sizedBoxH12,
                CustomTextField(
                  hint: 'کلمه عبور جدید:',
                  controller: null,
                  prefixIcon: Padding(
                    padding: paddingSuffixIcon,
                    child: Assets.image.svg.lock.svg(width: 24),
                  ),
                ),
                sizedBoxH24,
                _descriptionText(
                  themeData,
                  'کلمه عبور جدید را مجددا وارد کنید:',
                ),
                sizedBoxH12,
                CustomTextField(
                  hint: 'تایید کلمه عبور جدید:',
                  controller: null,
                  prefixIcon: Padding(
                    padding: paddingSuffixIcon,
                    child: Assets.image.svg.lock.svg(width: 24),
                  ),
                ),
                sizedBoxH36,
                GradiantButton(
                  gradient: LightColorPalette.defaultOkButton,
                  onTap: () {},
                  label: 'تایید',
                  icon: Assets.image.svg.check.svg(width: 20),
                  textStyle: themeData.textTheme.button,
                  height: homeButtonSizeHeight,
                  width: homeButtonSizeWidth,
                  borderRadius: circular18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _descriptionText(ThemeData themeData, String text) {
    return Padding(
      padding: padding4R,
      child: Text(
        text,
        style: themeData.textTheme.subtitle2,
      ),
    );
  }

  Widget _largeText(ThemeData themeData, String text) {
    return Text(
      text,
      style: themeData.textTheme.headline2,
    );
  }
}
