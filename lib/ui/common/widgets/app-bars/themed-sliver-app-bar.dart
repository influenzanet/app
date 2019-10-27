import 'package:flutter/material.dart';

class ThemedSliverAppBar extends SliverAppBar {
  factory ThemedSliverAppBar(ThemeData themeData, {@required String titleText, List<Widget> actions}) {
    return ThemedSliverAppBar.widget(
      themeData,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: TextStyle(color: themeData.primaryColor),
      ),
      actions: actions,
    );
  }

  ThemedSliverAppBar.widget(ThemeData themeData, {Widget title, List<Widget> actions})
      : super(
          centerTitle: true,
          floating: true,
          pinned: true,
          title: title,
          actions: actions,
        );
}
