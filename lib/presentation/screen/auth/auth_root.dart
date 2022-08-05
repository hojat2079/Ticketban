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

    //handle only portrait Screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.background,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: themeData.colorScheme.background,
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
                //appbar
                Padding(
                  padding: padding24,
                  child: appbar,
                ),

                sizedBoxH16,

                //bannerImage
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

                //child this root
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
