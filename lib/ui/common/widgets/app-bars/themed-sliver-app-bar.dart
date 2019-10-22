import 'package:flutter/material.dart';

class ThemedSliverAppBar extends SliverAppBar {
  ThemedSliverAppBar(ThemeData themeData, {@required String titleText, List<Widget> actions})
      : super(
          centerTitle: true,
          floating: true,
          pinned: true,
          title: Text(
            titleText,
            textAlign: TextAlign.center,
            style: TextStyle(color: themeData.primaryColor),
          ),
          actions: actions,
        );
}
