import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/fonts.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';

class AppThemeConfig {
  static const String faPrimaryFontFamily = FontFamily.kalameh;

  static const defaultTextStyle = TextStyle(
    fontFamily: faPrimaryFontFamily,
    fontSize: 14,
  );

  final Brightness brightness;
  final Color primary;
  final Color surface;
  final Color onPrimary;
  final Color background;
  final Color secondary;
  final Color onSecondary;

  AppThemeConfig.light()
      : brightness = Brightness.light,
        primary = LightColorPalette.blue,
        surface = LightColorPalette.whiteCard,
        onPrimary = LightColorPalette.blackTextColor,
        background = LightColorPalette.background,
        secondary = LightColorPalette.greenBlue,
        onSecondary = Colors.white;

  ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.light(
          primary: primary,
          surface: surface,
          onPrimary: onPrimary,
          secondary: onSecondary,
          background: background,
          onSecondary: onSecondary),
      textTheme: TextTheme(
        bodyText2: defaultTextStyle.copyWith(color: onPrimary),
      ),
    );
  }
}
