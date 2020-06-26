import 'package:flutter/material.dart';

ThemeData influenzaNetTheme = ThemeData(
  primarySwatch: ThemeElements.primarySwatch,
  primaryColor: ThemeElements.primaryColor,
  primaryColorLight: ThemeElements.primaryColorLight,
  primaryColorDark: ThemeElements.primaryColorDark,
  accentColor: ThemeElements.accentColor,
  canvasColor: ThemeElements.canvasColor,
  disabledColor: Colors.grey[350],
  textTheme: TextTheme(
      caption: ThemeElements.displayTextStyle,
      button: ThemeElements.displayTextStyle,
      overline: ThemeElements.displayTextStyle,
      subtitle2: ThemeElements.displayTextStyle,
      subtitle1: ThemeElements.displayTextStyle,
      headline6: ThemeElements.displayTextStyle,
      headline5: ThemeElements.displayTextStyle,
      headline4: ThemeElements.displayTextStyle,
      headline3: ThemeElements.displayTextStyle,
      headline2: ThemeElements.displayTextStyle,
      headline1: ThemeElements.displayTextStyle),
  buttonTheme: ButtonThemeData(
      buttonColor: ThemeElements.primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    brightness: Brightness.light,
    elevation: 0.0,
    iconTheme: IconThemeData(color: ThemeElements.accentColor),
  ),
  dividerTheme: DividerThemeData(space: ThemeElements.elementPadding / 2),
);

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

  static const Color helpBackgroundColor = const Color(0xfff2f2f2);

  static const TextStyle displayTextStyle = TextStyle(color: Colors.black);
  static const TextStyle bigButtonTextStyle = TextStyle(fontSize: 20.0);
  static const TextStyle hintTextStyle = TextStyle();

  static const TextStyle errorTextStyle =
      TextStyle(color: Color(0xffb02300), fontWeight: FontWeight.bold);
  static const TextStyle warningTextStyle =
      TextStyle(color: Color(0xffffce00), fontWeight: FontWeight.bold);

  static const TextStyle longTextFormFieldTextStyle = TextStyle(fontSize: 14.0);

  static const EdgeInsetsGeometry bigButtonPaddingGeometry =
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0);

  static const double pagePadding = 16.0;
  static const double elementPadding = 16.0;
  static const double connectedElementPadding = 12.0;
  static const double listItemPadding = connectedElementPadding / 2;
  static const double cardContentPadding = 12.0;
  static const double cardElementPadding = 8.0;

  static const double cardBorderRadius = 12.0;

  static const listPageItemEdgeInsets = const EdgeInsets.only(
    left: ThemeElements.connectedElementPadding,
    top: ThemeElements.connectedElementPadding,
    right: ThemeElements.connectedElementPadding,
  );
}
