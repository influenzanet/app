import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class SurveySingleItemProvider with ChangeNotifier {
  String _surveyItemkey;
  ResponseItem _responseItem;

  ResponseItem get responseItem {
    return _responseItem;
  }

  set responseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + responseItem.toJson());
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

  void initResponseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response init=' + _responseItem.toJson());
    notifyListeners();
  }
}
