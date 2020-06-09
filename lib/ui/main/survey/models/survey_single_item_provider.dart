import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class SurveySingleItemProvider with ChangeNotifier {
  String _surveyItemkey;
  ResponseItem _responseItem;
  SurveySingleItemProvider({String surveyItemKey, ResponseItem responseItem}) {
    this._surveyItemkey = surveyItemKey;
    this._responseItem = responseItem;
  }

  ResponseItem get responseItem {
    return _responseItem;
  }

  set responseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + responseItem.toJson());
    debugPrint('Survey key=' + _surveyItemkey);
    notifyListeners();
  }

  String get surveyKey {
    return _surveyItemkey;
  }

  set surveyKey(String key) {
    _surveyItemkey = key;
    debugPrint('Survey key set=' + _surveyItemkey);
    notifyListeners();
  }

  void initResponseItem(dynamic response, String key) {
    _responseItem = ResponseItem.fromMap(response);
    _surveyItemkey = key;
    notifyListeners();
  }
}
