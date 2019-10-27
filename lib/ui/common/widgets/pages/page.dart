import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:InfluenzaNet/ui/main/notifications/notification-button.dart';
import 'package:flutter/material.dart';

abstract class Page extends StatelessWidget {
  final String titleText;
  final Widget titleWidget;
  final bool appBar;
  final bool drawer;
  final bool notificationButton;
  final List<Widget> actions;

  Page({
    this.titleText = '',
    this.titleWidget,
    this.appBar = true,
    this.drawer = true,
    this.notificationButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return buildPage(context, themeData);
  }

  Widget buildPage(BuildContext context, ThemeData themeData);

  Widget drawerWidget() {
    return (drawer) ? MainDrawer() : null;
  }

  List<Widget> appBarActions() {
    return <Widget>[
      if (actions != null) ...actions,
      if (notificationButton) NotificationButton(),
    ];
  }
}
