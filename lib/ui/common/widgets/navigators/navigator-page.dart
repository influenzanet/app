import 'package:flutter/material.dart';

/// Allows the back button to work properly on Android and keeps navigation state.
class NavigatorPage extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

  final String initialRoute;
  final RouteFactory onGenerateRoute;

  NavigatorPage({this.initialRoute, this.onGenerateRoute});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !(await navigatorKey.currentState.maybePop());
      },
      child: Navigator(
        key: navigatorKey,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
