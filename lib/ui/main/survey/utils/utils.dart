import 'package:InfluenzaNet/ui/main/survey/models/constants.dart';
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
      {String groupKey, String value, ResponseItem responseItem}) {
    dynamic response = responseItem.toMap();
    int position =
        response['items'].indexWhere((item) => item['key'] == groupKey);
    response['items'][position]['items'][firstKey]['value'] = value;
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
}
