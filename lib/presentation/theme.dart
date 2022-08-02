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
  final Color surfaceV;
  final Color surfaceTint;
  final Color onPrimary;
  final Color background;
  final Color secondary;
  final Color onSecondary;
  final Color onSurface;
  final Color divider;
  final Color icon;
  final Color primaryV;
  final Color error;
  final Color inverseSurface;

  AppThemeConfig.light()
      : brightness = Brightness.light,
        primary = LightColorPalette.blue,
        surface = LightColorPalette.whiteCard,
        surfaceV = LightColorPalette.white,
        onPrimary = LightColorPalette.blackTextColor,
        background = LightColorPalette.background,
        secondary = LightColorPalette.greenBlue,
        onSecondary = LightColorPalette.whiteCard,
        onSurface = LightColorPalette.blackTextColor,
        divider = LightColorPalette.grey,
        primaryV = LightColorPalette.darkBlue,
        icon = LightColorPalette.white,
        surfaceTint = LightColorPalette.grayContainer,
        inverseSurface = LightColorPalette.whiteShadow,
        error = LightColorPalette.darkerRed;

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
          onSurface: onSurface,
          surfaceVariant: surfaceV,
          surfaceTint: surfaceTint,
          error: error,
        ),
        textTheme: TextTheme(
            bodyText2: defaultTextStyle,
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
            headline2: defaultTextStyle.copyWith(
              color: onSurface,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
            subtitle1: defaultTextStyle.copyWith(
              color: onSurface,
              fontSize: 18,
            ),
            subtitle2: defaultTextStyle.copyWith(
              color: onSurface,
              fontSize: 15,
              fontWeight: FontWeight.w500,
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
            caption: defaultTextStyle.copyWith(
              fontSize: 11,
              color: onSurface,
            )),
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
