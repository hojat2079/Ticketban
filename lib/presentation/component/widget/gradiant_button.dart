import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class GradiantButton extends StatelessWidget {
  final Gradient gradient;
  final Function() onTap;
  final String label;
  final Widget? icon;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const GradiantButton({
    Key? key,
    required this.gradient,
    required this.onTap,
    this.textStyle,
    required this.label,
    this.icon,
    this.width = authButtonSizeWidth,
    this.height = authButtonSizeHeight,
    this.borderRadius = circular16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          maximumSize: MaterialStateProperty.all(Size(width, height)),
          padding: MaterialStateProperty.all(padding0)),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minWidth: width,
              minHeight: height,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
                if (icon != null) sizedBoxW12,
                if (icon != null) icon!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
