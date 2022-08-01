import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class GradiantButton extends StatelessWidget {
  final Gradient gradient;
  final Function() onTap;
  final String label;
  final TextStyle? textStyle;

  const GradiantButton({
    Key? key,
    required this.gradient,
    required this.onTap,
    this.textStyle,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: circular16,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          maximumSize: MaterialStateProperty.all(buttonSize),
          padding: MaterialStateProperty.all(padding0)),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: circular16,
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              minWidth: buttonSize.width,
              minHeight: buttonSize.height,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
