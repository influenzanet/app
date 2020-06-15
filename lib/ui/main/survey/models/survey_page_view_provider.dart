import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:flutter/cupertino.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List _surveyPage;

  SurveyPageViewProvider({List page}) {
    this._surveyPage = page ?? qp;
    debugPrint('init something');
    notifyListeners();
  }
  set surveyPageList(List page) {
    _surveyPage = page;
    notifyListeners();
  }

  get surveyPageList {
    return this._surveyPage;
  }
}
