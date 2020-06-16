import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:flutter/cupertino.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List<SurveySingleItem> _surveyPage;

  SurveyPageViewProvider({List page}) {
    _surveyPage = [];
    var items = page ?? qp;
    items.forEach((item) {
      _surveyPage
          .add(SurveySingleItem(response: false, surveySingleItemModel: item));
    });
    this._surveyPage = _surveyPage;
    debugPrint('init something');
    notifyListeners();
  }

  set surveyPageList(List page) {
    _surveyPage = page;
    notifyListeners();
  }

  get surveyPageList {
    return _surveyPage;
  }

  void setResponded(String key) {
    SurveySingleItem item = getSurveyItemByKey(key);
    item.responded = true;
    debugPrint('Responded key=' + key);
  }

  SurveySingleItem getSurveyItemByKey(String key) {
    int position =
        _surveyPage.indexWhere((item) => item.surveySingleItem['key'] == key);
    return _surveyPage[position];
  }
}
