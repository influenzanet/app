import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/page.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:flutter/material.dart';

abstract class ScaffoldPage extends Page {
  final bool scrollable;

  ScaffoldPage({
    String titleText = '',
    Widget titleWidget,
    bool appBar = true,
    bool drawer = true,
    bool notificationButton = true,
    List<Widget> actions,
    this.scrollable = false,
  }) : super(
          titleText: titleText,
          titleWidget: titleWidget,
          appBar: appBar,
          drawer: drawer,
          notificationButton: notificationButton,
          actions: actions,
        );

  @override
  Widget buildPage(BuildContext context, ThemeData themeData) {
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

  Widget buildBody(BuildContext context, ThemeData themeData);
}
