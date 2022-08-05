import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class HomeRoute extends StatelessWidget {
  final Widget child;
  static const double bottomNavHeight = 101;
  static const double _bottomNavBlur = 38;
  static const double bottomNavContainerHeight = 70;
  static const double _bottomNavIconSize = 65;
  static const BorderRadius _bottomNavIconBorderRadius =
      BorderRadius.all(Radius.circular(25));
  static const BorderRadius _bottomNavBorderRadius = BorderRadius.vertical(
    top: Radius.circular(25),
  );

  const HomeRoute({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    const Color color1 = Color(0xff54E8D6);
    const Color color2 = Color(0xff6914CD);
    const Color colorText = Color(0xff6448D0);

    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surface,
      statusBarIconBrightness: Brightness.dark,
    ));

    //handle only portrait Screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceVariant,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavContainerHeight,
              child: child,
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: bottomNavHeight,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      top: 31,
                      child: _containerBottomNav(themeData),
                    ),
                    Positioned(
                      child: Center(
                        child: Column(
                          children: [
                            _iconBottomNav(
                              color1: color1,
                              color2: color2,
                              onTap: () {
                                backHomeAction(context);
                              },
                            ),
                            sizedBoxH8,
                            _textBottomNav(
                              themeData: themeData,
                              colorText: colorText,
                              text: 'Home',
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _containerBottomNav(ThemeData themeData) {
    return Container(
      height: bottomNavContainerHeight,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        borderRadius: _bottomNavBorderRadius,
        boxShadow: [
          _containerShadow(themeData),
        ],
      ),
    );
  }

  BoxShadow _containerShadow(ThemeData themeData) {
    return BoxShadow(
      color: themeData.colorScheme.inverseSurface.withOpacity(0.2),
      blurRadius: _bottomNavBlur,
    );
  }

  Widget _textBottomNav({
    required ThemeData themeData,
    required Color colorText,
    required String text,
  }) {
    return Text(
      text,
      style: themeData.textTheme.bodyText1!.copyWith(
        color: colorText,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _iconBottomNav({
    required Color color2,
    required Color color1,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _bottomNavIconSize,
        width: _bottomNavIconSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: _bottomNavIconBorderRadius,
          boxShadow: [_iconShadow(color2)],
          gradient: _iconGradiant(color1, color2),
        ),
        child: Assets.image.svg.home.svg(),
      ),
    );
  }

  BoxShadow _iconShadow(Color color2) {
    return BoxShadow(
      color: color2.withOpacity(0.6),
      blurRadius: 10,
    );
  }

  Gradient _iconGradiant(Color color1, Color color2) {
    return LinearGradient(
      colors: [
        color1,
        color2,
      ],
      stops: const [
        0.0,
        0.8,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  void backHomeAction(BuildContext context) {
    Navigator.pop(context);
  }
}
