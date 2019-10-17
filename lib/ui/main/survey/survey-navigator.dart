import 'package:InfluenzaNet/ui/common/widgets/navigators/navigator-page.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:InfluenzaNet/ui/main/survey/question-page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyNavigator extends StatelessWidget {
  static const String questionRoute = 'survey/question';

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void pushMainRoute() {
    MainNavigator.navigatorKey.currentState.pushReplacementNamed(MainNavigator.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return NavigatorPage(
      navigatorKey: navigatorKey,
      initialRoute: questionRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case questionRoute:
            builder = _questionPage;
            break;
          default:
            print('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  QuestionPage _questionPage(BuildContext _) => QuestionPage(
        onAnswered: pushMainRoute,
      );
}
