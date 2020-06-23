import 'dart:convert';

import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:survey_engine.dart/api/api.dart';
import 'package:test/test.dart';

void main() {
  group('\n\nTest if reponseItem is constructed for text input component :\n',
      () {
    ResponseItem responseItem;
    dynamic responseMap;
    dynamic valuePair;
    setUp(() {
      responseMap = {"key": "2", "items": []};
      valuePair = {'key': '1.1.1', 'value': 'input data'};
      responseItem = ResponseItem.fromMap(responseMap);
      print('Response=' + responseMap.toString());
      print('Value pair=' + valuePair.toString());
    });
    test('Check if `null` is returned on a `null` ResponseItem`', () {
      expect(
          Utils.constructSingleValueResponseItem(
              valuePair: valuePair, responseItem: null),
          isNull);
    });

    test('Check if ResponseItem is constructed as expected`', () {
      dynamic expected = {
        "key": "2",
        "items": [
          {'key': '1.1.1', 'value': 'input data'}
        ]
      };
      expect(
          json.encode(Utils.constructSingleValueResponseItem(
              valuePair: valuePair, responseItem: responseItem)),
          json.encode(expected));
    });
  });
}
