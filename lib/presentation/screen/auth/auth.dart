import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/auth/forget_password_container.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_container.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_container.dart';

import 'appbar.dart';

class AuthScreen extends StatelessWidget {
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
                const Padding(
                  padding: padding24,
                  child: AppBarAuth(
                    gradient: LightColorPalette.registerButtonTextGradiant,
                    text: 'ثبت نام',
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
                const Padding(
                  padding: padding24H,
                  child: ForgetPasswordContainer(),
                ),
                sizedBoxH24
              ],
            ),
          ),
        ),
      ),
    );
  }
}
