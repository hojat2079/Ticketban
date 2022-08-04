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
        //add corner radius for button
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),

        //button size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        maximumSize: MaterialStateProperty.all(Size(width, height)),

        //button padding
        padding: MaterialStateProperty.all(padding0),
      ),
      child: _gradiantWidget(),
    );
  }

  Widget _gradiantWidget() {
    return Ink(
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
              _labelText(),
              //handle icon in button
              if (icon != null) sizedBoxW8,
              if (icon != null) icon!,
            ],
          ),
        ),
      ),
    );
  }

  Widget _labelText() {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: textStyle,
    );
  }
}
