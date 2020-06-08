import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class ResponseModel with ChangeNotifier {
  String surveyItemkey;
  ResponseItem _responseItem;
  //ResponseModel({this.surveyItemkey, this._responseItem});

  ResponseItem get responseItem {
    return _responseItem;
  }

  set responseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + responseItem.toJson());
    notifyListeners();
  }

  void initResponseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response init=' + _responseItem.toJson());
    notifyListeners();
  }
}
