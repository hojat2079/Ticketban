import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class AuthRoot extends StatelessWidget {
  final Widget child;
  final Widget appbar;

  const AuthRoot({Key? key, required this.child, required this.appbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surfaceVariant,
      statusBarIconBrightness: Brightness.dark,
    ));

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
                Padding(
                  padding: padding24,
                  child: appbar,
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
                Padding(
                  padding: padding24,
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
