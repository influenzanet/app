import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/cupertino.dart';

class SurveyPageViewProvider with ChangeNotifier {
  List<SurveySingleItemProvider> _surveyPage;
  SurveyPageViewProvider({List<SurveySingleItemProvider> page}) {
    this._surveyPage = page ?? Utils.initSurveyPageProvider(qp);
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
