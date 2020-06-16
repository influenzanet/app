import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class SurveySingleItemModel {
  dynamic _surveySingleItemModel;
  bool responseSet;
  ResponseItem _responseItem;
  SurveySingleItemModel(
      {ResponseItem responseItem,
      dynamic surveySingleItemModel,
      bool responseSet}) {
    this._responseItem = responseItem;
    this._surveySingleItemModel = surveySingleItemModel;
    this.responseSet = responseSet;
  }

  get responded {
    return responseSet;
  }

  set responded(bool resp) {
    responseSet = resp;
  }

  get surveySingleItem {
    return _surveySingleItemModel;
  }

  set surveySingleItem(dynamic item) {
    _surveySingleItemModel = item;
    debugPrint('Single item set with=' + item['key'].toString());
  }

  ResponseItem getResponseItem() {
    return _responseItem;
  }

  void setResponseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + _responseItem.toJson());
  }

  void initResponseItem(dynamic response, String key) {
    _responseItem = ResponseItem.fromMap(response);
  }
}
