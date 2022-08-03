import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class FileComponent extends StatelessWidget {
  final String title;
  final Widget image;
  final double height;
  final double width;

  const FileComponent({
    Key? key,
    this.title = 'جهت درج فایل کلیک کنید',
    required this.image,
    this.height = 125,
    this.width = 189,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surfaceVariant,
        border: Border.all(
          color: const Color(
            0xffEAEAEA,
          ),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: themeData.colorScheme.inverseSurface,
            blurRadius: 30,
          )
        ],
        borderRadius: circular18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: themeData.textTheme.caption,
          ),
          sizedBoxH16,
          image
        ],
      ),
    );
  }
}
