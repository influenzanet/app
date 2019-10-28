import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-sliver-app-bar.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:InfluenzaNet/ui/main/notifications/notification-button.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

abstract class ListPage extends StatefulWidget {
  final String titleText;
  final Widget titleWidget;
  final bool appBar;
  final bool drawer;
  final bool notificationButton;
  final List<Widget> actions;

  ListPage({
    this.titleText = '',
    this.titleWidget,
    this.appBar = true,
    this.drawer = true,
    this.notificationButton = true,
    this.actions,
  });

  @override
  _ListPageState createState() => _ListPageState();

  List<Widget> buildChildren(BuildContext context, ThemeData themeData);
  Widget buildBottomWidget(BuildContext context, ThemeData themeData) => Container();
}

class _ListPageState extends State<ListPage> with AfterLayoutMixin<ListPage> {
  ScrollController _scrollController;
  bool _enoughSpace = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
      setState(() {
        _enoughSpace = true;
      });
    } else {
      setState(() {
        _enoughSpace = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      drawer: drawerWidget(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                if (widget.appBar) (widget.titleWidget == null) ? _appBar(themeData) : _widgetAppBar(themeData),
                SliverList(
                  delegate: SliverChildListDelegate(
                    _children(context, themeData),
                  ),
                )
              ],
            ),
          ),
          if (_enoughSpace) widget.buildBottomWidget(context, themeData),
          if (_enoughSpace) bottomPaddingWidget(context),
        ],
      ),
    );
  }

  Widget drawerWidget() {
    return (widget.drawer) ? MainDrawer() : null;
  }

  ThemedSliverAppBar _appBar(ThemeData themeData) {
    return ThemedSliverAppBar(
      themeData,
      titleText: widget.titleText,
      actions: appBarActions(),
    );
  }

  ThemedSliverAppBar _widgetAppBar(ThemeData themeData) {
    return ThemedSliverAppBar.widget(themeData, title: widget.titleWidget, actions: appBarActions());
  }

  List<Widget> appBarActions() {
    return <Widget>[
      if (widget.actions != null) ...widget.actions,
      if (widget.notificationButton) NotificationButton(),
    ];
  }

  List<Widget> _children(BuildContext context, ThemeData themeData) {
    List<Widget> children = widget.buildChildren(context, themeData);

    if (!_enoughSpace) {
      children.add(widget.buildBottomWidget(context, themeData));
      children.add(bottomPaddingWidget(context));
    }

    return children;
  }

  Widget bottomPaddingWidget(BuildContext context) {
    EdgeInsets safePadding = MediaQuery.of(context).padding;

    return Container(height: ThemeElements.pagePadding + safePadding.bottom);
  }
}
