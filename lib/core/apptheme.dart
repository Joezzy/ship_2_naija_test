import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';

enum Screen { phone, tab, win }

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(35, 132, 74, 1);
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color secondaryColor = Color.fromRGBO(238, 255, 236, 1);
  // static const Color backgroundColor = Colors.grey;
  static const Color backgroundColor = Color.fromRGBO(231, 232, 239, 1);

  static TextStyle numericStyle() =>
      TextStyle(fontSize: MySize.size28, fontWeight: FontWeight.bold);

  static TextStyle exportHeaderStyle() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: MySize.size20,
      );

  static TextStyle detailHeaderStyle() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: MySize.size16,
      );

  static TextStyle formHeaderStyle() =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: MySize.size25);

  Color lighten(Color color, {double amount = .08}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  static String money(double amount, {int digits = 2}) {
    var amt = NumberFormat.currency(
            symbol: '', locale: 'en-UK', decimalDigits: digits)
        .format(amount);
    return "N${amt}";
  }

  static String formatNumber(String amt, {int digits = 2}) {
    double amount = double.parse(amt.toString());
    return NumberFormat.currency(
            symbol: '', locale: 'en-UK', decimalDigits: digits)
        .format(amount);
  }

  static String formatTime(DateTime date) {
    return DateFormat("hh:mm a").format(date.toLocal());
  }

  static String formatDateTime(DateTime datetime) {
    String time = DateFormat("hh:mm a").format(datetime.toLocal());
    String date = DateFormat("dd/MM/yyy").format(datetime.toLocal());
    return "$date, $time";
  }

  static Screen getScreen() {
    // MediaQueryData win =  MediaQueryData.fromView(WidgetsBinding.instance.window);
    MediaQueryData win = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);
    double size = win.size.shortestSide;
    Screen screen = Screen.phone;
    if (size <= 760) {
      screen = Screen.phone;
    } else if (size > 760 && size < 1200) {
      screen = Screen.tab;
    } else if (size >= 1201) {
      screen = Screen.win;
    }
    return screen;
  }
}
