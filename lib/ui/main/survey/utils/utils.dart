import 'package:InfluenzaNet/ui/main/survey/models/constants.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
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
    if (itemComponents == null) {
      return null;
    }
    dynamic localisedObject = itemComponents['content'].firstWhere(
        (localizedObject) => localizedObject['code'] == code, orElse: () {
      print('No content found');
      return null;
    });
    String parts = (localisedObject == null)
        ? 'No content found'
        : localisedObject['parts'].join();
    return parts;
  }

  static getPartsByCode(dynamic content, {String code = "en"}) {
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

  static constructSingleResponseItem(
      {String key, String value, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    dynamic newResponse = {'key': key, 'value': value};
    response['items'] = [newResponse];
    return response;
  }

  static constructSingleChoiceGroupItem(
      {String groupKey, String key, String value, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    dynamic newResponse = {'key': key, 'value': value};
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items'] = [newResponse];
    return response;
  }

  static constructSingleChoiceInputGroupItem(
      {String groupKey, String key, String value, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items']
        [firstKey] = {'key': key, 'value': value};
    return response;
  }

  static constructMultipleChoiceInputGroupItem(
      {String groupKey, String key, String value, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    int groupPosition =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    int position = response['items'][groupPosition]['items']
        .indexWhere((item) => item['key'] == key);
    response['items'][groupPosition]['items']
        [position] = {'key': key, 'value': value};
    return response;
  }

  static constructMultipleChoiceGroupItem(
      {String groupKey, List keys, List values, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    List newResponse = keys.map((key) => {'key': key.toString()}).toList();
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items'] = newResponse;
    return response;
  }

  static initSurveyPageProvider(List flattenedSurveyItems) {
    List<SurveySingleItemProvider> initProvider = [];
    flattenedSurveyItems.forEach((item) {
      SurveySingleItemProvider provider =
          SurveySingleItemProvider(surveyItemKey: item['key']);
      List responseList = [];
      dynamic responseComponent = Utils.getSingleItemComponentsByRole(
          item['components']['items'], 'responseGroup');
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
      provider.responseItem = result;
      initProvider.add(provider);
    });
    return initProvider;
  }
}
