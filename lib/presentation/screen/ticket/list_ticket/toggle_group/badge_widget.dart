import 'package:flutter/material.dart';
import 'package:ticketban_mobile/util/extension.dart';

class BadgeWidget extends StatelessWidget {
  final String number;

  const BadgeWidget({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Text(
        number.toFaNumber(),
        style: themeData.textTheme.caption!.copyWith(
          color: Colors.black,
          fontSize: 8,
        ),
      ),
    );
  }
}
