import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:survey_engine.dart/api/api.dart';

class Utils {
  static getSingleItemComponentsByRole(dynamic itemComponents, String role,
      {String code = "en"}) {
    dynamic component = itemComponents
        .firstWhere((comp) => comp['role'] == role, orElse: () => null);
    if (component == null ||
        ((component['displayCondition'] != null) &&
            (component['displayCondition'] == false))) {
      return null;
    }
    return component;
  }

  static getContent(dynamic itemComponents, {String code = "en"}) {
    if (itemComponents == null || itemComponents['content'] == null) {
      return null;
    }
    dynamic localisedObject = itemComponents['content'].firstWhere(
        (localizedObject) => localizedObject['code'] == code, orElse: () {
      print('No content found');
      return null;
    });
    String parts = localisedObject['parts'].join();
    return parts;
  }

  static getDescription(dynamic itemComponents, {String code = "en"}) {
    if (itemComponents == null || itemComponents['description'] == null) {
      return null;
    }
    dynamic localisedObject = itemComponents['description'].firstWhere(
        (localizedObject) => localizedObject['code'] == code, orElse: () {
      print('No description found');
      return null;
    });
    String parts = localisedObject['parts'].join();
    return parts;
  }

  static getPartsByCode(dynamic content, {String code = "en"}) {
    if (content == null) {
      return '';
    }
    dynamic localisedObject = content.firstWhere(
        (localizedObject) => localizedObject['code'] == code, orElse: () {
      print('No content found');
      return null;
    });
    String parts = (localisedObject == null)
        ? 'No content found'
        : localisedObject['parts'].join();
    return parts;
  }

  static constructSingleValueResponseItem(
      {dynamic valuePair, ResponseItem responseItem}) {
    if (responseItem == null) {
      print('Response item is null and response cannot be constructed');
      return null;
    }
    dynamic response = responseItem.toMap();
    response['items'] = [valuePair];
    return response;
  }

  static constructSingleChoiceGroupItem(
      {String groupKey, dynamic valuePair, ResponseItem responseItem}) {
    if (responseItem == null) {
      print('Response item is null and response cannot be constructed');
      return null;
    }
    dynamic response = responseItem.toMap();
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items'] = [valuePair];
    return response;
  }

  static constructMultipleChoiceGroupItem(
      {String groupKey, List valuePairs, ResponseItem responseItem}) {
    if (responseItem == null) {
      print('Response item is null and response cannot be constructed');
      return null;
    }
    dynamic response = responseItem.toMap();
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items'] = valuePairs;
    return response;
  }

  static constructMultipleChoiceInputGroupItem(
      {String groupKey, dynamic valuePair, ResponseItem responseItem}) {
    if (responseItem == null) {
      print('Response item is null and response cannot be constructed');
      return null;
    }
    dynamic response = responseItem.toMap();
    int groupPosition =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    int position = response['items'][groupPosition]['items']
        .indexWhere((item) => item['key'] == valuePair['key']);
    response['items'][groupPosition]['items'][position] = valuePair;
    return response;
  }

  static initSurveyPageProvider(List surveyItems) {
    List<SurveySingleItemModel> items = [];
    surveyItems.forEach((surveyItem) {
      SurveySingleItemModel surveySingleItem = SurveySingleItemModel(
          responseSet: false, surveySingleItemModel: surveyItem);
      List responseList = [];
      dynamic responseComponent = Utils.getSingleItemComponentsByRole(
          surveyItem['components']['items'], 'responseGroup');
      List itemList = responseComponent['items'];
      itemList.forEach((item) {
        switch (item['role']) {
          case 'singleChoiceGroup':
          case 'multipleChoiceGroup':
          case 'dropDownGroup':
            responseList.add({'key': item['key'], 'items': []});
            break;
          default:
            break;
        }
      });
      dynamic result = {'key': responseComponent['key'], 'items': responseList};
      surveySingleItem.setResponseItem(result);
      items.add(surveySingleItem);
    });
    return items;
  }

  static rerenderSurveyPageProvider(
      List<SurveySingleItemModel> originalModels, List surveyItems) {
    List<SurveySingleItemModel> items = [];
    surveyItems.forEach((surveyItem) {
      SurveySingleItemModel updatedSurveyModel = originalModels.singleWhere(
          (model) => (model.surveySingleItem['key'] == surveyItem['key']),
          orElse: () => null);
      if (updatedSurveyModel != null) {
        items.add(updatedSurveyModel);
        return;
      }
      SurveySingleItemModel surveySingleItem = SurveySingleItemModel(
          responseSet: false, surveySingleItemModel: surveyItem);
      List responseList = [];
      dynamic responseComponent = Utils.getSingleItemComponentsByRole(
          surveyItem['components']['items'], 'responseGroup');
      List itemList = responseComponent['items'];
      itemList.forEach((item) {
        switch (item['role']) {
          case 'singleChoiceGroup':
          case 'multipleChoiceGroup':
          case 'dropDownGroup':
            responseList.add({'key': item['key'], 'items': []});
            break;
          default:
            break;
        }
      });
      dynamic result = {'key': responseComponent['key'], 'items': responseList};
      surveySingleItem.setResponseItem(result);
      items.add(surveySingleItem);
    });
    return items;
  }
}
