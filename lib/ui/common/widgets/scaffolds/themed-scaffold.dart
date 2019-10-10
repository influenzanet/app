import 'package:flutter/material.dart';

class ThemedScaffold extends Scaffold {
  ThemedScaffold({PreferredSizeWidget appBar, Widget body})
      : super(
            appBar: appBar,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: body,
              ),
            ));

  ThemedScaffold.scrollable(BuildContext context, {PreferredSizeWidget appBar, Widget body})
      : super(
            appBar: appBar,
            body: SingleChildScrollView(
              child: SizedBox(
                height: _screenHeight(context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: body,
                ),
              ),
            ));

  static double _screenHeight(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return height - padding.top - padding.bottom - kToolbarHeight;
  }
}
