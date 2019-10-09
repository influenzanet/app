import 'package:flutter/material.dart';

ThemeData influenzaNetTheme = ThemeData(
    primarySwatch: ThemeElements.primarySwatch,
    primaryColor: ThemeElements.primaryColor,
    primaryColorLight: ThemeElements.primaryColorLight,
    primaryColorDark: ThemeElements.primaryColorDark,
    accentColor: ThemeElements.accentColor,
    canvasColor: ThemeElements.canvasColor,
    textTheme: TextTheme(
        display1: ThemeElements.displayTextStyle,
        display2: ThemeElements.displayTextStyle,
        display3: ThemeElements.displayTextStyle,
        display4: ThemeElements.displayTextStyle),
    buttonTheme: ButtonThemeData(
        buttonColor: ThemeElements.primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0))),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      //color: ThemeElements.canvasColor,
      brightness: Brightness.light,
      elevation: 0.0,
      iconTheme: IconThemeData(color: ThemeElements.accentColor),
    ));

class ThemeElements {
  static const MaterialColor primarySwatch = MaterialColor(0xff4b669d, {
    50: const Color(0xffe5e9f0),
    100: const Color(0xffbec7dc),
    200: const Color(0xff94a4c4),
    300: const Color(0xff6c81ad),
    400: const Color(0xff4b669d),
    500: const Color(0xff284d8e),
    600: const Color(0xff214686),
    700: const Color(0xff173d7a),
    800: const Color(0xff0f336e),
    900: const Color(0xff042357),
  });

  static const MaterialColor accentSwatch = MaterialColor(0xff61b1b0, {
    50: const Color(0xffe2f1f2),
    100: const Color(0xffb7dddd),
    200: const Color(0xff8ac7c7),
    300: const Color(0xff61b1b0),
    400: const Color(0xff49a09e),
    500: const Color(0xff36908c),
    600: const Color(0xff33837f),
    700: const Color(0xff2e746f),
    800: const Color(0xff29645f),
    900: const Color(0xff1f4843),
  });

  static const Color primaryColor = const Color(0xff0f346e);
  static const Color primaryColorLight = const Color(0xff475d9d);
  static const Color primaryColorDark = const Color(0xff000e42);

  static const Color accentColor = const Color(0xff61b1b0);
  static const Color accentColorLight = const Color(0xff93e3e2);
  static const Color accentColorDark = const Color(0xff2d8181);

  static const Color canvasColor = const Color(0xfff2f2f2);

  static const TextStyle displayTextStyle = TextStyle(
    color: Colors.black,
  );
}
