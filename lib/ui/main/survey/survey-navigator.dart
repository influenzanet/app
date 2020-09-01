import 'dart:async' show Future;

import 'package:InfluenzaNet/ui/common/widgets/navigators/navigator-page.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/first-question-page.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey-wecome-page.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

class SurveyNavigator extends StatelessWidget {
  static const String surveyWelcomeRoute = 'survey/welcome';
  static const String firstQuestionRoute = 'survey/firstQuestion';

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void pushMainRoute() {
    MainNavigator.navigatorKey.currentState
        .pushReplacementNamed(MainNavigator.homeRoute);
  }

  static void pushFirstQuestionRoute() {
    SurveyNavigator.navigatorKey.currentState
        .pushNamed(SurveyNavigator.firstQuestionRoute);
  }

  Future<String> loadSurvey() async {
    return await rootBundle.loadString('assets/data/survey_sample.json');
  }

  @override
  Widget build(BuildContext context) {
    String surveyJson;
    loadSurvey().then((value) {
      surveyJson = value;
    });
    return ChangeNotifierProvider(
      create: (context) => SurveyPageViewProvider(survey: surveyJson),
      child: NavigatorPage(
        navigatorKey: navigatorKey,
        initialRoute: surveyWelcomeRoute,
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;

          // To do: New question pages are to be added onces the survey-engine can handle pagination
          switch (settings.name) {
            case surveyWelcomeRoute:
              builder = _surveyWelcomePage;
              break;
            case firstQuestionRoute:
              builder = _firstQuestionPage;
              break;
            default:
              print('Invalid route: ${settings.name}');
          }

          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }

  SurveyWelcomePage _surveyWelcomePage(BuildContext _) => SurveyWelcomePage(
        onStart: pushFirstQuestionRoute,
      );
  FirstQuestionPage _firstQuestionPage(BuildContext _) => FirstQuestionPage(
        onAnswered: pushMainRoute,
      );
}
