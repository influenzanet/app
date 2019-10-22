import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedScaffold extends Scaffold {
  ThemedScaffold({PreferredSizeWidget appBar, Widget drawer, Widget body})
      : super(
            appBar: appBar,
            drawer: drawer,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: ThemeElements.pagePadding),
                child: body,
              ),
            ));

  ThemedScaffold.scrollable(BuildContext context, {PreferredSizeWidget appBar, Widget drawer, Widget body})
      : super(
            appBar: appBar,
            drawer: drawer,
            body: SingleChildScrollView(
              child: SizedBox(
                height: _screenHeight(context, withoutAppBar: appBar != null),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: ThemeElements.pagePadding),
                  child: body,
                ),
              ),
            ));

  static double _screenHeight(BuildContext context, {bool withoutAppBar = true}) {
    double height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;
    double safeHeight = height - padding.top - padding.bottom;
    if (withoutAppBar) {
      return safeHeight - kToolbarHeight;
    } else {
      return safeHeight;
    }
  }
}
