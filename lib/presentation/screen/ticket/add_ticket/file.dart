import 'package:flutter/material.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';

class FileComponent extends StatelessWidget {
  final String title;
  final Widget image;
  final double height;
  final double width;
  static const double defaultHeight = 125;
  static const double defaultWidth = 189;

  const FileComponent({
    Key? key,
    this.title = 'جهت درج فایل کلیک کنید',
    required this.image,
    this.height = defaultHeight,
    this.width = defaultWidth,
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
        border: _border(),
        boxShadow: [_fileShadow(themeData)],
        borderRadius: circular18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_titleText(themeData), sizedBoxH16, image],
      ),
    );
  }

  Border _border() {
    return Border.all(
      color: const Color(
        0xffEAEAEA,
      ),
      width: 1,
    );
  }

  Text _titleText(ThemeData themeData) {
    return Text(
      title,
      style: themeData.textTheme.caption,
    );
  }

  BoxShadow _fileShadow(ThemeData themeData) {
    return BoxShadow(
      color: themeData.colorScheme.inverseSurface,
      blurRadius: 30,
    );
  }
}
