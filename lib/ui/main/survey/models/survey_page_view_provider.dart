import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:flutter/cupertino.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List<SurveySingleItemProvider> _surveyPage;
  SurveyPageViewProvider({List<SurveySingleItemProvider> page}) {
    this._surveyPage = page;
    debugPrint('init something');
    notifyListeners();
  }
  set surveyPageList(List page) {
    _surveyPage = page;
    notifyListeners();
  }

  get surveyPageList {
    return this._surveyPage;
  }
}
