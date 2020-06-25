import 'package:flutter/material.dart';
import 'package:survey_engine.dart/api/api.dart';

class SurveySingleItemModel {
  dynamic _surveySingleItemModel;
  bool responseSet;
  ResponseItem _responseItem;
  dynamic presetValue;
  SurveySingleItemModel(
      {ResponseItem responseItem,
      dynamic surveySingleItemModel,
      bool responseSet,
      dynamic presetValue}) {
    this._responseItem = responseItem;
    this._surveySingleItemModel = surveySingleItemModel;
    this.responseSet = responseSet;
    this.presetValue = presetValue;
  }

  get surveyKey => _surveySingleItemModel['key'];
  get preset => presetValue;

  set preset(dynamic value) {
    presetValue = value;
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

  set responseItem(ResponseItem responseItem) {
    _responseItem = responseItem;
  }

  ResponseItem getResponseItem() {
    return _responseItem;
  }

  void setResponseItem(dynamic response) {
    _responseItem = ResponseItem.fromMap(response);
    debugPrint('Response set=' + _responseItem?.toJson());
  }

  void initResponseItem(dynamic response, String key) {
    _responseItem = ResponseItem.fromMap(response);
  }

  SurveySingleItemModel copyWith({
    dynamic surveySingleItemModel,
    bool responseSet,
    ResponseItem responseItem,
    dynamic presetValue,
  }) {
    return SurveySingleItemModel(
      surveySingleItemModel:
          surveySingleItemModel ?? this._surveySingleItemModel,
      responseSet: responseSet ?? this.responseSet,
      responseItem: responseItem ?? this._responseItem,
      presetValue: presetValue ?? this.presetValue,
    );
  }
}
