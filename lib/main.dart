import 'package:flutter/material.dart';
import 'package:ticketban_mobile/di/app.dart';
import 'package:ticketban_mobile/presentation/route.dart';
import 'package:ticketban_mobile/presentation/screen/add_ticket/add_ticket_screen.dart';
import 'package:ticketban_mobile/presentation/screen/change_password/change_password.dart';
import 'package:ticketban_mobile/presentation/screen/home/home.dart';
import 'package:ticketban_mobile/presentation/theme.dart';

void main() async {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticketban',
      theme: AppThemeConfig.light().getTheme(),
      // onGenerateRoute: _appRoute.onGenerateRoute,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: AddNewTicketScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _appRoute.dispose();
    super.dispose();
  }
}
