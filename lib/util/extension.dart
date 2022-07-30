extension NumberStringFormat on String {
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
  String toFormatMinSecTime() {
    String min = (this ~/ 60).toString().padLeft(2, '0');
    String sec = (this % 60).toString().padLeft(2, '0');
    return '$min:$sec'.toFaNumber();
  }
}
