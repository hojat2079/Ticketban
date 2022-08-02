import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class ElevatedTextField extends StatelessWidget {
  final bool obscure = false;
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

  const ElevatedTextField({
    Key? key,
    this.controller,
    this.maxLength,
    required this.keyboardType,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.isPassword = false,
    this.height,
    this.topPadding = 6,
    this.bottomPadding = 6,
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
        right: 16,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        border: Border.all(
          color: const Color(
            0xffEAEAEA,
          ),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: 30,
          )
        ],
        borderRadius: borderRadius,
      ),
      child: TextField(
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
              fontSizeFactor: 0.9),
          prefixIconConstraints: const BoxConstraints(
            minWidth: iconSize,
            minHeight: iconSize,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        obscureText: isPassword,
      ),
    );
  }
}
