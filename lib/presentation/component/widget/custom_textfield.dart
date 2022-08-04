import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType keyboardType;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextField(
      style: themeData.textTheme.bodyText2!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      maxLines: 1,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterStyle: const TextStyle(
          height: double.minPositive,
        ),
        counterText: "",
        isDense: true,
        enabledBorder: _enabledBorder(themeData),
        focusedBorder: _focusedBorder(),
        label: _hintText(themeData),
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

  OutlineInputBorder _focusedBorder() {
    return const OutlineInputBorder(
      borderRadius: circular21,
      borderSide: BorderSide(color: Colors.black, width: 1),
    );
  }

  OutlineInputBorder _enabledBorder(ThemeData themeData) {
    return OutlineInputBorder(
      borderRadius: circular21,
      borderSide: BorderSide(color: themeData.dividerColor, width: 0.5),
    );
  }

  Text _hintText(ThemeData themeData) {
    return Text(
      hint,
      style: themeData.textTheme.bodyText2!.apply(
          color: themeData.colorScheme.onSurface.withOpacity(
            0.7,
          ),
          fontSizeFactor: 0.9),
    );
  }
}
