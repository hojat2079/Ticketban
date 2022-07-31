import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ticketban_mobile/gen/assets.gen.dart';
import 'package:ticketban_mobile/presentation/color.dart';
import 'package:ticketban_mobile/presentation/component/dimension.dart';
import 'package:ticketban_mobile/presentation/component/widget/custom_textfield.dart';
import 'package:ticketban_mobile/presentation/component/widget/gradiant_button.dart';
import 'package:ticketban_mobile/util/extension.dart';

class OtpScreen extends StatefulWidget {
  final String title;
  final String desc;
  static const Color endButtonColor = Color(0xff2872FB);
  static const String route = '/otp';

  const OtpScreen({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _currentTime = 120;
  bool _timeOut = false;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        borderRadius: circular32,
      ),
      child: Padding(
        padding: padding32H,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxH20,
            Text(
              widget.title,
              style: themeData.textTheme.headline4,
            ),
            sizedBoxH24,
            Text(
              widget.desc,
              style: themeData.textTheme.bodyText2!.apply(fontSizeFactor: 0.95),
            ),
            sizedBoxH24,
            CustomTextField(
              controller: _otpController,
              keyboardType: TextInputType.phone,
              hint: 'کد اعتبارسنجی ۶ رقمی',
              prefixIcon: Padding(
                padding: paddingSuffixIcon,
                child: Assets.image.svg.password.svg(),
              ),
              suffixIcon: _timeOut ? _endButton(themeData) : null,
              maxLength: 4,
            ),
            sizedBoxH16,
            Text(
              '${_currentTime.toFormatMinSecTime().toFaNumber()}    باقی مانده است',
              style: themeData.textTheme.bodyText2!.apply(
                color: themeData.colorScheme.primaryContainer,
                fontSizeFactor: 0.85,
              ),
            ),
            sizedBoxH24,
            GradiantButton(
              gradient: LightColorPalette.registerButtonTextGradiant,
              onTap: () {},
              label: 'تایید و ورود',
              textStyle: themeData.textTheme.button!.apply(
                fontSizeFactor: 0.9,
              ),
            ),
            sizedBoxH24,
          ],
        ),
      ),
    );
  }

  Widget _endButton(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            OtpScreen.endButtonColor,
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: circular14,
            ),
          ),
          minimumSize: MaterialStateProperty.all(size0),
          padding: MaterialStateProperty.all(padding8H),
        ),
        onPressed: () {},
        child: Text(
          'ارسال مجدد',
          style: themeData.textTheme.bodyText2!.apply(
              color: themeData.colorScheme.onSecondary, fontSizeFactor: 0.75),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_currentTime == 0) {
          setState(() {
            timer.cancel();
            _timeOut = true;
          });
        } else {
          setState(() {
            _currentTime--;
          });
        }
      },
    );
  }
}
