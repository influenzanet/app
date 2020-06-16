import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class SurveySingleItem {
  dynamic _surveySingleItemModel;
  bool responseSet;
  String _surveyItemkey;
  ResponseItem _responseItem;
  SurveySingleItem(
      {String surveyItemKey,
      ResponseItem responseItem,
      dynamic surveySingleItemModel,
      bool response}) {
    this._surveyItemkey = surveyItemKey;
    this._responseItem = responseItem;
    this._surveySingleItemModel = surveySingleItemModel;
    this.responseSet = response;
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

  ResponseItem get responseItem {
    return _responseItem;
  }

  set responseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + responseItem.toJson());
    debugPrint('Survey key=' + _surveyItemkey);
  }

  String get surveyKey {
    return _surveyItemkey;
  }

  set surveyKey(String key) {
    _surveyItemkey = key;
    debugPrint('Survey key set=' + _surveyItemkey);
  }

  void initResponseItem(dynamic response, String key) {
    _responseItem = ResponseItem.fromMap(response);
    _surveyItemkey = key;
    debugPrint('Init function for key' + _surveyItemkey);
  }
}
