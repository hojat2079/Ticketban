import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/screen/auth/auth.dart';
import 'package:ticketban_mobile/presentation/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticketban',
      theme: AppThemeConfig.light().getTheme(),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: AuthScreen(),
      ),
    );
  }
}
