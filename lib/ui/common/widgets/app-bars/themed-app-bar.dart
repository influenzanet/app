import 'package:flutter/material.dart';

class ThemedAppBar extends AppBar {
  factory ThemedAppBar(ThemeData themeData, {String titleText = ''}) {
    return ThemedAppBar.widget(themeData,
        title: Text(titleText,
            textAlign: TextAlign.center,
            //style: themeData.textTheme.display1.copyWith(color: themeData.primaryColor, fontSize: 30.0),
            style: TextStyle(color: themeData.primaryColor)));
  }

  ThemedAppBar.widget(ThemeData themeData, {Widget title}) : super(centerTitle: true, title: title);
}
