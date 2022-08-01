import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/fonts.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';

import 'component/dimension.dart';

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
  final Color onSurface;
  final Color divider;
  final Color icon;
  final Color primaryV;
  final Color inverseSurface;

  AppThemeConfig.light()
      : brightness = Brightness.light,
        primary = LightColorPalette.blue,
        surface = LightColorPalette.whiteCard,
        onPrimary = LightColorPalette.blackTextColor,
        background = LightColorPalette.background,
        secondary = LightColorPalette.greenBlue,
        onSecondary = LightColorPalette.whiteCard,
        onSurface = LightColorPalette.blackTextColor,
        divider = LightColorPalette.grey,
        primaryV = LightColorPalette.darkBlue,
        icon = LightColorPalette.blackTextColor,
        inverseSurface = LightColorPalette.whiteShadow;

  ThemeData getTheme() {
    return ThemeData(
        colorScheme: ColorScheme.light(
            primary: primary,
            surface: surface,
            onPrimary: onPrimary,
            secondary: onSecondary,
            background: background,
            onSecondary: onSecondary,
            primaryContainer: primaryV,
            inverseSurface: inverseSurface,
            onSurface: onSurface),
        textTheme: TextTheme(
          bodyText2: defaultTextStyle.copyWith(color: onPrimary),
          headline6: defaultTextStyle.copyWith(
            color: onSurface,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          headline5: defaultTextStyle.copyWith(
            color: onSurface,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          headline3: defaultTextStyle.copyWith(
            color: onSurface,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          subtitle1: defaultTextStyle.copyWith(
            fontSize: 18,
          ),
          headline4: defaultTextStyle.copyWith(
            color: onSurface,
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
          button: defaultTextStyle.copyWith(
            color: onSecondary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        dividerColor: divider,
        dividerTheme: DividerThemeData(
          color: divider,
          space: dividerSize,
        ),
        iconTheme: IconThemeData(color: icon, size: 24),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: onPrimary,
          contentTextStyle: defaultTextStyle.copyWith(color: onSecondary),
        ));
  }
}
