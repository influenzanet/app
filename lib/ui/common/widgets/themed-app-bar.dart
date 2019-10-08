import 'package:flutter/material.dart';

class ThemedAppBar extends AppBar {
  factory ThemedAppBar(ThemeData themeData, {String titleText = ''}) {
    return ThemedAppBar.widget(themeData,
        title: Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(color: themeData.primaryColor),
        ));
  }

  ThemedAppBar.widget(ThemeData themeData, {Widget title})
      : super(brightness: Brightness.light, backgroundColor: Colors.white, centerTitle: true, title: title);
}
