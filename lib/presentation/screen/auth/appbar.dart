import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';

class AppBarAuth extends StatelessWidget {
  final String text;
  final Gradient gradient;

  const AppBarAuth({
    Key? key,
    required this.text,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      padding: appbarPadding,
      decoration: BoxDecoration(
        borderRadius: circular32,
        color: themeData.colorScheme.surface,
      ),
      child: Row(
        children: [
          Assets.image.svg.logo.svg(),
          sizedBoxW8,
          Expanded(
            child: GradientText(
              'تیکت بان',
              gradient: LightColorPalette.defaultTextGradiant,
              style: themeData.textTheme.headline5,
            ),
          ),
          GradiantButton(
            label: text,
            onTap: () {},
            gradient: gradient,
            textStyle: themeData.textTheme.button,
          ),
          //gradiant button
        ],
      ),
    );
  }
}
