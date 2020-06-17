import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:InfluenzaNet/ui/main/survey/models/qpattern4.dart';
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

  void setResponded(String key, {dynamic presetValue, dynamic responseItem}) {
    int position = getItemPosition(key);
    SurveySingleItemModel item = _surveyPage[position];
    item.responded = true;
    item.presetValue = presetValue;
    item.setResponseItem(responseItem);
    _surveyPage[position] = item;
    debugPrint('Responded key=' + key);
    reRenderSimulate();
  }

  void reRenderSimulate() {
    _surveyPage = Utils.rerenderSurveyPageProvider(_surveyPage, q4);
  }

  int getItemPosition(String key) {
    return _surveyPage
        .indexWhere((item) => item.surveySingleItem['key'] == key);
  }

  SurveySingleItemModel getSurveyItemByKey(String key) {
    return _surveyPage[getItemPosition(key)];
  }
}
