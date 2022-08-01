import 'package:flutter/material.dart';

class LightColorPalette {
  static const whiteCard = Color(0xffF4F4F4);
  static const white = Colors.white;
  static Color whiteShadow = const Color(0xff7A7A7A).withOpacity(0.15);
  static const blackTextColor = Color(0xff626262);
  static const black = Color(0xff292D32);
  static const blue = Color(0xff2C6DF8);
  static const darkBlue = Color(0xff1529CE);
  static const purple = Color(0xff6542D0);
  static const greenBlue = Color(0xff58C7D5);
  static const grey = Color(0xff8F8F8F);
  static const background = Color(0xffE7E7F2);
  static const red = Color(0xffFF4F4F);
  static const darkRed = Color(0xffE52323);
  static const green = Color(0xff00B7A1);
  static const yellow = Color(0xffFFC24B);
  static const dialogTextColor = Color(0xff3A3A3A);

  static const Gradient defaultTextGradiant = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.02, 0.3, 0.9],
    colors: [
      Color(0xff6914CD),
      Color(0xff2C6DF8),
      Color(0xff54E8D6),
    ],
  );
  static const Gradient loginButtonTextGradiant = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xff2575FC),
      Color(0xff6A11CB),
    ],
  );
  static const Gradient registerButtonTextGradiant = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xff54E8D6),
      Color(0xff152BCD),
      Color(0xff1427CD),
    ],
  );

  static const defaultOuterGradiantAvatar = LinearGradient(
    colors: [
      Color(0xff1427CD),
      Color(0xffFFFFFF),
      Color(0xffCD14BA),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  static const defaultInnerGradiantAvatar = LinearGradient(
    colors: [
      Color(0xff54E8D6),
      Color(0xffFFFFFF),
      Color(0xff6914CD),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const defaultOkButton = LinearGradient(
    colors: [
      Color(0xff001A16),
      Color(0xff54E8D6),
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );
}
