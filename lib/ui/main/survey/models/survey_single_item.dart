import 'package:flutter/material.dart';

class SurveySingleItemModel with ChangeNotifier {
  dynamic surveySingleItem;
  SurveySingleItemModel({
    this.surveySingleItem,
  });

  void currentItem(dynamic item) {
    surveySingleItem = item;
  }
}
