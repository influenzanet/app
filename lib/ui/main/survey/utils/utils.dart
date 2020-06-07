import 'package:InfluenzaNet/ui/main/survey/models/constants.dart';
import 'package:survey_engine.dart/api/api.dart';

class Utils {
  // The function will be replaced by api fetched from backend
  static List<dynamic> getFlattenedRenderedSurvey(dynamic questionGroup,
      {String parentKey}) {
    if (questionGroup == null) return null;
    dynamic flatRenderedList = [];
    for (final item in questionGroup['items']) {
      if (item['items'] == null) {
        flatRenderedList.add(item);
      } else {
        flatRenderedList.addAll(getFlattenedRenderedSurvey(item));
      }
    }
    return flatRenderedList.toList();
  }

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

  static getListItemComponentsByRole(List itemComponents, String role,
      {String code = "en"}) {
    if (itemComponents == null) {
      return null;
    }
    dynamic components =
        itemComponents.where((comp) => comp['role'] == role).toList();
    components = components
        .where((comp) => (comp['displayCondition'] != false ||
            comp['displayCondition'] != null))
        .toList();
    if (components == null || components?.length == 0) {
      return null;
    }
    return components;
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

  // static getQuestionList(List surveySingleItem, {String code = "en"}) {
  //   List<String> questions = [];
  //   surveySingleItem.forEach((item) {
  //     String question =
  //         getContentByRole(item['components']['items'], 'title', code: code);
  //     questions.add(question);
  //   });
  //   return questions;
  // }

  // static getContentListByRole(List itemComponents, String role,
  //     {String code = "en"}) {
  //   List<String> contentList = [];
  //   if (itemComponents == null) {
  //     return null;
  //   }
  //   List componentsByRole =
  //       getListItemComponentsByRole(itemComponents, role, code: code);
  //   componentsByRole.forEach((component) {
  //     contentList.add(getPartsByCode(component['content'], code: code));
  //   });
  //   return contentList;
  // }

  // static getHelpGroupContents(List itemComponents, {String code = "en"}) {
  //   return getContentListByRole(itemComponents, 'text', code: code);
  // }

  // static getHelpGroupList(List surveySingleItem, {String code = "en"}) {
  //   List<List<String>> helpList = [];
  //   surveySingleItem.forEach((question) {
  //     dynamic helpGroup = getSingleItemComponentsByRole(
  //         question['components']['items'], 'helpGroup');
  //     List<String> contents = getHelpGroupContents(helpGroup['items']);
  //     helpList.add(contents);
  //     print('here');
  //   });
  //   return helpList;
  // }
}
