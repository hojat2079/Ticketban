import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Row(
      children: [
        Assets.image.svg.logo.svg(width: 44),
        sizedBoxW12,
        GradientText(
          'تیکت بان',
          gradient: LightColorPalette.defaultTextGradiant,
          style: themeData.textTheme.headline5,
        ),
        const Spacer(),
      ],
    );
  }
}
