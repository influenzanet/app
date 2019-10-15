import 'package:flutter/material.dart';

class ThemedAppBar extends AppBar {
  factory ThemedAppBar(ThemeData themeData, {String titleText = '', List<Widget> actions}) {
    return ThemedAppBar.widget(
      themeData,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(color: themeData.primaryColor),
      ),
      actions: actions,
    );
  }

  ThemedAppBar.widget(ThemeData themeData, {Widget title, List<Widget> actions})
      : super(centerTitle: true, title: title, actions: actions);
}
