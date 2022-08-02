import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class CustomMenuItem extends StatelessWidget {
  final Widget icon;
  final Text text;
  final Function() onTap;

  const CustomMenuItem(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: circular28,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: themeData.colorScheme.inverseSurface,
                blurRadius: 30,
              )
            ],
            borderRadius: circular28,
            color: themeData.colorScheme.surfaceVariant,
          ),
          child: Row(
            children: [
              icon,
              sizedBoxW12,
              text,
            ],
          ),
        ),
      ),
    );
  }
}
