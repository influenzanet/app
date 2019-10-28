import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:InfluenzaNet/ui/main/notifications/notification-button.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldPage extends StatelessWidget {
  final String titleText;
  final Widget titleWidget;
  final bool appBar;
  final bool drawer;
  final bool notificationButton;
  final List<Widget> actions;

  final bool scrollable;

  ScaffoldPage({
    this.titleText = '',
    this.titleWidget,
    this.appBar = true,
    this.drawer = true,
    this.notificationButton = true,
    this.actions,
    this.scrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return (scrollable)
        ? ThemedScaffold.scrollable(
            context,
            appBar: _appBar(themeData),
            drawer: drawerWidget(),
            body: buildBody(context, themeData),
          )
        : ThemedScaffold(
            appBar: _appBar(themeData),
            drawer: drawerWidget(),
            body: buildBody(context, themeData),
          );
  }

  Widget drawerWidget() {
    return (drawer) ? MainDrawer() : null;
  }

  PreferredSizeWidget _appBar(ThemeData themeData) {
    if (!appBar) return null;
    return (titleWidget == null)
        ? ThemedAppBar(
            themeData,
            titleText: titleText,
            actions: appBarActions(),
          )
        : ThemedAppBar.widget(
            themeData,
            title: titleWidget,
            actions: appBarActions(),
          );
  }

  List<Widget> appBarActions() {
    return <Widget>[
      if (actions != null) ...actions,
      if (notificationButton) NotificationButton(),
    ];
  }

  Widget buildBody(BuildContext context, ThemeData themeData);
}
