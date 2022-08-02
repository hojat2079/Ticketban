import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/list_ticket/toggle_group/badge_widget.dart';

class CustomToggleButtonUnSelected extends StatelessWidget {
  final String text;
  final String number;

  const CustomToggleButtonUnSelected(
      {Key? key, required this.text, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: themeData.textTheme.caption!.copyWith(
            color: themeData.colorScheme.onSurface,
            fontSize: 11,
          ),
        ),
        sizedBoxW8,
        BadgeWidget(number: number)
      ],
    );
  }
}
