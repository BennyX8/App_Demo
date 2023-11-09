import 'package:flutter/material.dart';

class Palette {
  static Color s50 = const Color(0xFFF9F9F9);
  static Color s100 = const Color(0xFFF5F5F5);
  static Color s200 = const Color(0xFFE0E0E0);
  static Color s300 = const Color(0xFFCBCBCB);
  static Color s400 = const Color(0xFFB6B6B6);
  static Color s500 = const Color(0xFF002E66);
  static Color s600 = const Color(0xFF676767);
  static Color s700 = const Color(0xFF494949);
  static Color s800 = const Color(0xFF2B2B2B);
  static Color s900 = const Color(0xFF1f1f1f);

  static Color background = const Color(0xFF060E16);
  static Color overlay = const Color(0xFF0D2430);
  static Color blueHue = const Color(0xFF0083B9);
  static Color iconColor = const Color(0xFFCCC5A9);
  static Color highlightColor = const Color(0xFFF4A261);
  static Color cardColor = const Color(0x44555552);
  static Color textColor = Colors.grey.shade300;
  static Color buttonColor = const Color.fromARGB(84, 73, 75, 76);
}

MaterialColor primarySwatch = MaterialColor(
  Palette.s500.value,
  {
    50: Palette.s50,
    100: Palette.s100,
    200: Palette.s200,
    300: Palette.s300,
    400: Palette.s400,
    500: Palette.s500,
    600: Palette.s600,
    700: Palette.s700,
    800: Palette.s800,
    900: Palette.s900,
  },
);
