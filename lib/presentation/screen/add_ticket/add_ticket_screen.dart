import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/elevated_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/presentation/screen/add_ticket/file.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';

import 'drop_down.dart';

class AddNewTicketScreen extends StatelessWidget {
  static const String route = 'new-ticket';

  const AddNewTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: themeData.colorScheme.surfaceVariant,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceVariant,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: padding36H,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH24,
                const HomeAppBar(),
                sizedBoxH36,
                Text(
                  'ارسال تیکت جدید',
                  style: themeData.textTheme.headline2,
                ),
                sizedBoxH32,
                Padding(
                  padding: padding4R,
                  child: Text(
                    'نوع درخواست:',
                    style: themeData.textTheme.subtitle2,
                  ),
                ),
                sizedBoxH12,
                DropDownTicketType(),
                sizedBoxH24,
                Padding(
                  padding: padding4R,
                  child: Text(
                    'موضوع درخواست:',
                    style: themeData.textTheme.subtitle2,
                  ),
                ),
                sizedBoxH12,
                const ElevatedTextField(
                  keyboardType: TextInputType.text,
                  hint: 'نوشتن موضوع درخواست...',
                  isPassword: false,
                ),
                sizedBoxH24,
                Padding(
                  padding: padding4R,
                  child: Text(
                    'متن درخواست:',
                    style: themeData.textTheme.subtitle2,
                  ),
                ),
                sizedBoxH12,
                const ElevatedTextField(
                  keyboardType: TextInputType.text,
                  hint: 'نوشتن متن درخواست...',
                  isPassword: false,
                  maxLines: 8,
                  height: 150,
                ),
                sizedBoxH24,
                Padding(
                  padding: padding4R,
                  child: Text(
                    'درج فایل',
                    style: themeData.textTheme.subtitle2,
                  ),
                ),
                sizedBoxH12,
                FileComponent(image: Assets.image.svg.file.svg()),
                sizedBoxH48,
                Center(
                  child: GradiantButton(
                    gradient: LightColorPalette.defaultOkButton,
                    onTap: () {},
                    label: 'ارسال',
                    icon: Assets.image.svg.send.svg(width: 18),
                    textStyle: themeData.textTheme.button,
                    height: homeButtonSizeHeight,
                    width: homeButtonSizeWidth,
                    borderRadius: circular18,
                  ),
                ),
                sizedBoxH32
              ],
            ),
          ),
        ),
      ),
    );
  }
}
