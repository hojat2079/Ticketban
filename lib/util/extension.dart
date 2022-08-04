import 'package:flutter/material.dart';

extension NumberStringFormat on String {
  //persian number
  String toFaNumber() {
    return replaceAll('1', '۱')
        .replaceAll('2', '۲')
        .replaceAll('3', '۳')
        .replaceAll('4', '۴')
        .replaceAll('5', '۵')
        .replaceAll('6', '۶')
        .replaceAll('7', '۷')
        .replaceAll('8', '۸')
        .replaceAll('9', '۹')
        .replaceAll('0', '۰');
  }
}

extension NumberIntFormat on int {
  //time format
  String toFormatMinSecTime() {
    String min = (this ~/ 60).toString().padLeft(2, '0');
    String sec = (this % 60).toString().padLeft(2, '0');
    return '$min:$sec'.toFaNumber();
  }

  //time format use in app
  String toFormatStandardTimeInApp() {
    return '${toFormatMinSecTime().toFaNumber()}    باقی مانده است';
  }
}

extension ShowView on BuildContext {
  //show snackbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
