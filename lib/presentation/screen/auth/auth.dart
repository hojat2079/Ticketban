import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/auth/register_container.dart';

import 'appbar.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: padding24,
                  child: AppBarAuth(
                    gradient: LightColorPalette.loginButtonTextGradiant,
                    text: 'ورود',
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
                  child: RegisterContainer(),
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
