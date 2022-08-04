import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ticketban_mobile/data/local/app_preferences.dart';
import 'package:ticketban_mobile/di/app.dart';
import 'package:ticketban_mobile/domain/model/token_container.dart';
import 'package:ticketban_mobile/presentation/route.dart';
import 'package:ticketban_mobile/presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoute _appRoute = AppRoute();
  final GetIt instance = GetIt.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticketban',
      theme: AppThemeConfig.light().getTheme(),
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }

  @override
  void dispose() async {
    _appRoute.dispose();

    //save token in sharedPreferences
    if (TokenContainer.instance().accessToken != null &&
        TokenContainer.instance().refreshToken != null) {
      await instance<AppPreferences>().saveAllToken(
        TokenContainer.instance().accessToken!,
        TokenContainer.instance().refreshToken!,
      );
    }
    super.dispose();
  }
}
