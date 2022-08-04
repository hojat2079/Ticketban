import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class ElevatedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType keyboardType;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final int maxLines;
  final double? height;
  final double topPadding;
  final double bottomPadding;
  final BorderRadius borderRadius;
  static const int defaultMaxLine = 1;
  static const double defaultTopPadding = 6;
  static const double defaultBottomPadding = 6;
  static const double defaultRightPadding = 16;
  static const double defaultLeftPadding = 16;
  static const double defaultShadowBlurRadius = 30;
  static const double defaultWidthBorder = 1;
  static const Color defaultColorBorder = Color(0xffEAEAEA);

  const ElevatedTextField({
    Key? key,
    this.controller,
    this.maxLength,
    required this.keyboardType,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = defaultMaxLine,
    this.isPassword = false,
    this.height,
    this.topPadding = defaultTopPadding,
    this.bottomPadding = defaultBottomPadding,
    this.borderRadius = circular18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      height: height,
      padding: EdgeInsets.only(
        top: topPadding,
        bottom: bottomPadding,
        right: defaultRightPadding,
        left: defaultLeftPadding,
      ),
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        border: Border.all(
          color: defaultColorBorder,
          width: defaultWidthBorder,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: defaultLeftPadding,
          )
        ],
        borderRadius: borderRadius,
      ),
      child: _textField(themeData),
    );
  }

  Widget _textField(ThemeData themeData) {
    return TextField(
      style: themeData.textTheme.bodyText2!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          height: double.minPositive,
        ),
        counterText: "",
        isDense: true,
        border: InputBorder.none,
        hintText: hint,
        hintStyle: themeData.textTheme.bodyText2!.apply(
          color: themeData.colorScheme.onSurface.withOpacity(
            0.7,
          ),
          fontSizeFactor: 0.9,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: iconSize,
          minHeight: iconSize,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: isPassword,
    );
  }
}
