import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/screen/home/appbar.dart';
import 'package:ticketban_mobile/presentation/screen/home/avatar.dart';
import 'package:ticketban_mobile/presentation/screen/home/menu_item.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';
  static const String item1 = 'تیکت های شما';
  static const String item2 = 'ارسال تیکت جدید';
  static const String item3 = 'تغییر کلمه عبور';
  static const String item4 = 'خروج';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeData.colorScheme.surface,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: padding36H,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxH24,
                const HomeAppBar(),
                sizedBoxH24,
                const AvatarWidget(),
                sizedBoxH12,
                Text(
                  'دانیال کاظمی',
                  style: themeData.textTheme.headline3,
                ),
                sizedBoxH36,
                CustomMenuItem(
                  icon: Assets.image.svg.myTicket.svg(),
                  text: Text(
                    item1,
                    style: themeData.textTheme.subtitle1,
                  ),
                  onTap: () {},
                ),
                sizedBoxH20,
                CustomMenuItem(
                  icon: Assets.image.svg.allTicket.svg(),
                  text: Text(item2, style: themeData.textTheme.subtitle1),
                  onTap: () {},
                ),
                sizedBoxH20,
                CustomMenuItem(
                  icon: Assets.image.svg.passwordItem.svg(),
                  text: Text(item3, style: themeData.textTheme.subtitle1),
                  onTap: () {},
                ),
                sizedBoxH20,
                CustomMenuItem(
                  icon: Assets.image.svg.exit.svg(),
                  text: Text(item4, style: themeData.textTheme.subtitle1),
                  onTap: () {
                    showCustomDialog(
                        context: context,
                        title: 'آیا از خروج خود اطمینان دارید؟',
                        themeData: themeData);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showCustomDialog({
    required BuildContext context,
    required String title,
    required ThemeData themeData,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AlertDialog(
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
                child: Text(
                  title,
                  style: themeData.textTheme.headline6!.apply(
                    color: const Color(0xff3A3A3A),
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: LightColorPalette.green,
                    onPrimary: Colors.white,
                    textStyle: themeData.textTheme.headline6,
                    minimumSize: const Size(95, 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: circular10,
                    ),
                  ),
                  child: const Text('بله'),
                ),
                const SizedBox.shrink(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: LightColorPalette.red,
                    onPrimary: Colors.white,
                    textStyle: themeData.textTheme.headline6,
                    minimumSize: const Size(95, 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: circular10,
                    ),
                  ),
                  child: const Text('خیر'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
