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

  final bool obscure = false;
  final TextEditingController controller;
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
      style: themeData.textTheme.bodyText2,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: circular21,
          borderSide: BorderSide(color: themeData.dividerColor, width: 0.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: circular21,
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        label: Text(
          hint,
          style: themeData.textTheme.bodyText2!.apply(
            color: themeData.textTheme.bodyText2!.color!.withOpacity(0.7),
          ),
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
