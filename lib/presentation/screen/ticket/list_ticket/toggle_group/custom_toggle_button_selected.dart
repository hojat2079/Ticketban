import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/badge_widget.dart';

class CustomToggleButtonSelected extends StatelessWidget {
  final String text;
  final String number;

  const CustomToggleButtonSelected({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      height: 40,
      padding: padding1,
      decoration: const BoxDecoration(
        gradient: LightColorPalette.defaultToggleButton,
        borderRadius: circular10,
      ),
      child: Container(
        padding: padding6H,
        decoration: BoxDecoration(
          color: themeData.colorScheme.surfaceVariant,
          borderRadius: circular10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: themeData.textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeData.colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
            sizedBoxW8,
            BadgeWidget(
              number: number,
            )
          ],
        ),
      ),
    );
  }
}
