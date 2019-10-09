import 'package:flutter/material.dart';

class ThemedScaffold extends Scaffold {
  ThemedScaffold({PreferredSizeWidget appBar, Widget body})
      : super(
            appBar: appBar,
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: body,
            )));
}
