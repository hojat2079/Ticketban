import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/custom_toggle_button_selected.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/custom_toggle_button_unselected.dart';

class CustomToggleGroup extends StatelessWidget {
  static const List<String> status = [
    'در انتظار پاسخ',
    'همه تیکت‌ها',
    'پاسخ داده شده',
  ];
  static const Map<String, String> translateStatus = {
    'در انتظار پاسخ': 'Pending',
    'همه تیکت‌ها': 'all',
    'پاسخ داده شده': 'answered',
  };
  final int sizeAllTickets;
  final int sizeAnsweredTickets;
  final int sizePendingTickets;
  final int selectedIndex;

  const CustomToggleGroup(
      {Key? key,
      required this.sizeAllTickets,
      required this.sizeAnsweredTickets,
      required this.sizePendingTickets,
      required this.selectedIndex})
      : super(key: key);

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
        children: [
          _toggleItem(index: 0, numberBadge: sizePendingTickets.toString()),
          _toggleItem(index: 1, numberBadge: sizeAllTickets.toString()),
          _toggleItem(index: 2, numberBadge: sizeAnsweredTickets.toString()),
        ],
      ),
    );
  }

  Widget _toggleItem({required int index, required String numberBadge}) {
    return Flexible(
      flex: 1,
      child: index != selectedIndex
          ? CustomToggleButtonUnSelected(
              text: status[index],
              number: numberBadge,
            )
          : CustomToggleButtonSelected(
              text: status[index],
              number: numberBadge,
            ),
    );
  }
}
