import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/bloc/list_ticket_bloc.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/badge_widget.dart';
import 'package:ticketban_mobile/presentation/screen/ticket/list_ticket/toggle_group/custom_toggle_group.dart';

class CustomToggleButtonUnSelected extends StatelessWidget {
  final String text;
  final String number;

  const CustomToggleButtonUnSelected({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        handleButtonClicked(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //title text
          Text(
            text,
            style: themeData.textTheme.caption!.copyWith(
              color: themeData.colorScheme.onSurface,
              fontSize: 11,
            ),
          ),

          sizedBoxW8,

          //badge number
          BadgeWidget(number: number)
        ],
      ),
    );
  }

  void handleButtonClicked(BuildContext context) {
    context.read<ListTicketBloc>().add(ListTicketChangeStatus(
        status: CustomToggleGroup.translateStatus[text]!,
        index: CustomToggleGroup.status.indexOf(text)));
  }
}
