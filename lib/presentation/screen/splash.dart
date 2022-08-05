import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';
import 'package:ticketban_mobile/presentation/screen/auth/login_screen.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      //handle login or notLogin
      if (TokenContainer.instance().accessToken != '' &&
          TokenContainer.instance().accessToken != null) {
        Navigator.pushReplacementNamed(context, HomeScreen.route);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.route);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    //change status bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surfaceVariant,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: themeData.colorScheme.surfaceVariant,
    ));

    //handle only portrait Screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceVariant,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _logo(),
              sizedBoxH8,
              _headText(themeData),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() => Assets.image.svg.logo.svg(width: 60);

  Widget _headText(ThemeData themeData) {
    return GradientText(
      'تیکت بان',
      gradient: LightColorPalette.defaultTextGradiant,
      style: themeData.textTheme.headline3,
    );
  }
}
