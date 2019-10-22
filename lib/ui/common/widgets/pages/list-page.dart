import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-sliver-app-bar.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:InfluenzaNet/ui/main/notifications/notification-button.dart';
import 'package:flutter/material.dart';

abstract class ListPage extends StatelessWidget {
  final String titleText;
  final bool drawer;
  final bool notificationButton;

  ListPage({
    @required this.titleText,
    this.drawer = true,
    this.notificationButton = true,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      drawer: _drawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(themeData),
          SliverList(
            delegate: SliverChildListDelegate(
              _children(context, themeData),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawer() {
    return (drawer) ? MainDrawer() : null;
  }

  ThemedSliverAppBar _appBar(ThemeData themeData) {
    return ThemedSliverAppBar(
      themeData,
      titleText: titleText,
      actions: <Widget>[
        if (notificationButton) NotificationButton(),
      ],
    );
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
