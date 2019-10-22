import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:InfluenzaNet/ui/main/notifications/notification-button.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldPage extends StatelessWidget {
  final String titleText;
  final bool appBar;
  final bool drawer;
  final bool scrollable;
  final bool notificationButton;

  ScaffoldPage({
    @required this.titleText,
    this.appBar = true,
    this.drawer = true,
    this.scrollable = false,
    this.notificationButton = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return (scrollable)
        ? ThemedScaffold.scrollable(
            context,
            appBar: _appBar(themeData),
            drawer: _drawer(),
            body: buildBody(context, themeData),
          )
        : ThemedScaffold(
            appBar: _appBar(themeData),
            drawer: _drawer(),
            body: buildBody(context, themeData),
          );
  }

  PreferredSizeWidget _appBar(ThemeData themeData) {
    return (appBar)
        ? ThemedAppBar(
            themeData,
            titleText: titleText,
            actions: <Widget>[
              if (notificationButton) NotificationButton(),
            ],
          )
        : null;
  }

  Widget _drawer() {
    return (drawer) ? MainDrawer() : null;
  }

  Widget buildBody(BuildContext context, ThemeData themeData);
}
