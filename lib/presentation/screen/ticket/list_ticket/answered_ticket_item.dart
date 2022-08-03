import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/util/extension.dart';

class AnsweredTicketItem extends StatelessWidget {
  final String ticketTitle;
  final String ticketType;
  final Color ticketTypeColor;
  final String ticketDesc;
  final String ticketDate;
  final String adminMessage;

  const AnsweredTicketItem(
      {Key? key,
      required this.ticketTitle,
      required this.ticketType,
      required this.ticketTypeColor,
      required this.ticketDesc,
      required this.ticketDate,
      required this.adminMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      padding: padding18,
      margin: const EdgeInsets.only(bottom: 12, top: 12) + padding32H,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        borderRadius: circular16,
        border: Border.all(
          color: const Color(
            0xffE6E6E6,
          ),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleText(themeData),
              _dateText(themeData),
            ],
          ),
          sizedBoxH20,
          _textContainer(themeData, ticketDesc),
          sizedBoxH14,
          _adminText(themeData),
          sizedBoxH14,
          _textContainer(themeData, adminMessage),
        ],
      ),
    );
  }

  Widget _titleText(ThemeData themeData) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: ticketTitle,
            style: themeData.textTheme.bodyText2!.copyWith(
              color: themeData.colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: ' ($ticketType)',
            style: themeData.textTheme.bodyText2!.copyWith(
              color: ticketTypeColor,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }

  Widget _adminText(ThemeData themeData) {
    return Text(
      'پاسخ ادمین',
      style: themeData.textTheme.bodyText2!.copyWith(
        fontWeight: FontWeight.w700,
        color: themeData.colorScheme.onSurface,
      ),
    );
  }

  Widget _dateText(ThemeData themeData) {
    return Padding(
      padding: padding4L,
      child: Text(
        ticketDate.toFaNumber(),
        style: themeData.textTheme.caption!.copyWith(
          fontSize: 10,
          color: themeData.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _textContainer(ThemeData themeData, String text,
      [double height = 115]) {
    return Container(
      height: height,
      padding: padding12,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.7,
          color: const Color(0xffd6d6d6),
        ),
        borderRadius: circular12,
      ),
      child: Text(
        text,
        style: themeData.textTheme.caption!.copyWith(fontSize: 12),
      ),
    );
  }
}
