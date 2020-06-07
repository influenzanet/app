import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class ResponseModel with ChangeNotifier {
  String value;
  ResponseItem responseItem;
  ResponseModel({this.value, this.responseItem});

  ResponseItem getResponseItem() {
    return responseItem;
  }

  void setResponseItem(dynamic response) {
    responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + responseItem.toJson());
    notifyListeners();
  }

  void initResponseItem(dynamic response) {
    responseItem = ResponseItem.fromMap(response);
    debugPrint('Response init=' + responseItem.toJson());
    notifyListeners();
  }
}
