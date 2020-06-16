import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List<SurveySingleItemModel> _surveyPage;

  SurveyPageViewProvider({List page}) {
    _surveyPage = [];
    initialisePageItems(page ?? qp);
    this._surveyPage = _surveyPage;
  }
  void initialisePageItems(List page) {
    _surveyPage = Utils.initSurveyPageProvider(page);
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
    SurveySingleItemModel item = getSurveyItemByKey(key);
    item.responded = true;
    debugPrint('Responded key=' + key);
  }

  SurveySingleItemModel getSurveyItemByKey(String key) {
    int position =
        _surveyPage.indexWhere((item) => item.surveySingleItem['key'] == key);
    return _surveyPage[position];
  }
}
