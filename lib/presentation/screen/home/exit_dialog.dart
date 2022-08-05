import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/home/bloc/home_bloc.dart';

class ExitDialog extends StatelessWidget {
  final String title;

  const ExitDialog({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: circular28,
      ),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      titlePadding: const EdgeInsets.only(
        top: 24,
        bottom: 0,
        right: 16,
        left: 16,
      ),
      actionsPadding: const EdgeInsets.only(
        top: 20,
        bottom: 8,
        right: 16,
        left: 16,
      ),
      title: Center(
        child: _titleText(themeData),
      ),
      actions: [
        //yes action
        _actionButton(
          context: context,
          themeData: themeData,
          text: 'بله',
          color: LightColorPalette.green,
          onTap: () {
            context.read<HomeBloc>().add(const HomeExitButtonClicked());
          },
        ),
        //for space yes and no action
        const SizedBox.shrink(),

        //no action
        _actionButton(
          context: context,
          themeData: themeData,
          text: 'خیر',
          color: LightColorPalette.red,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _titleText(ThemeData themeData) {
    return Text(
      title,
      style: themeData.textTheme.headline6!.apply(
        color: const Color(0xff3A3A3A),
      ),
    );
  }

  Widget _actionButton({
    required BuildContext context,
    required ThemeData themeData,
    required String text,
    required Color color,
    required Function() onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: color,
        onPrimary: Colors.white,
        textStyle: themeData.textTheme.headline6,
        minimumSize: const Size(95, 35),
        shape: const RoundedRectangleBorder(
          borderRadius: circular10,
        ),
      ),
      child: Text(text),
    );
  }
}
