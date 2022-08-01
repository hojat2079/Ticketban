import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class AvatarWidget extends StatelessWidget {
  final String imagePath;
  final Gradient outerGradiant;
  final Gradient innerGradiant;
  final double height;
  final double width;

  const AvatarWidget({
    Key? key,
    this.imagePath = 'assets/image/png/avatar.png',
    this.outerGradiant = LightColorPalette.defaultOuterGradiantAvatar,
    this.innerGradiant = LightColorPalette.defaultInnerGradiantAvatar,
    this.height = 170,
    this.width = 170,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(defaultBorderSizeOuterGradiantAvatar),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: outerGradiant,
      ),
      child: Container(
        padding: padding12,
        decoration: BoxDecoration(
          color: themeData.colorScheme.surface,
          shape: BoxShape.circle,
        ),
        child: Container(
          padding: const EdgeInsets.all(defaultBorderSizeInnerGradiantAvatar),
          decoration: BoxDecoration(
            gradient: innerGradiant,
            shape: BoxShape.circle,
          ),
          child: Container(
            padding: padding12,
            decoration: BoxDecoration(
              color: themeData.colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
