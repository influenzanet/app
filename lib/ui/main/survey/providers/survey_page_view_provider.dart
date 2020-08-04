import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/models/unrendered/qp.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:influenzanet_survey_engine/api/api.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List<SurveySingleItemModel> _surveyPage;
  SurveyEngineCoreApi surveyEngineCore;
  dynamic _rendered;
  SurveyPageViewProvider({List page}) {
    SurveyGroupItem surveyGroupItem = SurveyGroupItem.fromMap(qpTest);
    surveyEngineCore = SurveyEngineCoreApi(surveyDef: surveyGroupItem);
    _rendered = surveyEngineCore.flattenSurveyItemtree();
    _surveyPage = [];
    initialisePageItems(page ?? _rendered);
    this._surveyPage = _surveyPage;
  }

  void initialisePageItems(List page) {
    _surveyPage = Utils.initSurveyPageProvider(page);
    debugPrint('Init page items');
    notifyListeners();
  }

  set surveyPageList(List page) {
    _surveyPage = page;
    notifyListeners();
  }

  get surveyPageList {
    return _surveyPage;
  }

  int getItemPosition(String key) {
    return _surveyPage
        .indexWhere((item) => item.surveySingleItem['key'] == key);
  }

  SurveySingleItemModel getSurveyItemByKey(String key) {
    return _surveyPage[getItemPosition(key)];
  }

  void reRender(String key, dynamic responseItem) {
    surveyEngineCore.setResponse(
        key: key, response: ResponseItem.fromMap(responseItem));
    dynamic reRendered = surveyEngineCore.flattenSurveyItemtree();
    if(reRendered.toString()!=_rendered.toString())
    {   
      _rendered = reRendered;
      _surveyPage = Utils.rerenderSurveyPageProvider(_surveyPage, reRendered);
    }
  }

  void setResponded(String key, {dynamic presetValue, dynamic responseItem}) {
    int position = getItemPosition(key);
    SurveySingleItemModel item = _surveyPage[position];
    item.responded = true;
    item.presetValue = presetValue;
    item.setResponseItem(responseItem);
    _surveyPage[position] = item;
    debugPrint('Responded key=' + key);
    reRender(key, responseItem);
    notifyListeners();
  }
}
