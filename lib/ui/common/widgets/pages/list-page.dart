import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-sliver-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/page.dart';
import 'package:flutter/material.dart';

abstract class ListPage extends Page {
  ListPage({
    String titleText = '',
    Widget titleWidget,
    bool appBar = true,
    bool drawer = true,
    bool notificationButton = true,
    List<Widget> actions,
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
    return Scaffold(
      drawer: drawerWidget(),
      body: CustomScrollView(
        slivers: <Widget>[
          if (appBar) (titleWidget == null) ? _appBar(themeData) : _widgetAppBar(themeData),
          SliverList(
            delegate: SliverChildListDelegate(
              _children(context, themeData),
            ),
          )
        ],
      ),
    );
  }

  ThemedSliverAppBar _appBar(ThemeData themeData) {
    return ThemedSliverAppBar(
      themeData,
      titleText: titleText,
      actions: appBarActions(),
    );
  }

  ThemedSliverAppBar _widgetAppBar(ThemeData themeData) {
    return ThemedSliverAppBar.widget(themeData, title: titleWidget, actions: appBarActions());
  }

  List<Widget> _children(BuildContext context, ThemeData themeData) {
    EdgeInsets safePadding = MediaQuery.of(context).padding;
    List<Widget> children = buildChildren(context, themeData);

    children.add(
      Container(
        height: ThemeElements.pagePadding + safePadding.bottom,
      ),
    );

    return children;
  }

  List<Widget> buildChildren(BuildContext context, ThemeData themeData);
}
