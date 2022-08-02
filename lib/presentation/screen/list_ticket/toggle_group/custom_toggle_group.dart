import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/list_ticket/toggle_group/custom_toggle_button_selected.dart';
import 'package:ticketban_mobile/presentation/screen/list_ticket/toggle_group/custom_toggle_button_unselected.dart';

class CustomToggleGroup extends StatelessWidget {
  const CustomToggleGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceTint,
        borderRadius: circular14,
      ),
      child: Row(
        children: const [
          Flexible(
            flex: 1,
            child: CustomToggleButtonUnSelected(
              text: 'پاسخ داده شده',
              number: '9',
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomToggleButtonSelected(
              text: 'پاسخ داده شده',
              number: '9',
            ),
          ),
          Flexible(
            flex: 1,
            child: CustomToggleButtonUnSelected(
              text: 'پاسخ داده شده',
              number: '9',
            ),
          ),
        ],
      ),
    );
  }
}
