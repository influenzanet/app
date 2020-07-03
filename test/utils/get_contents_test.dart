import 'dart:convert';

import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
      '\n\nTest if single item component is fetched appropriately from response component :\n',
      () {
    List items;
    setUp(() {
      items = [
        {
          "role": "title",
          "content": [
            {
              "code": "en",
              "parts": ["Survey question 1"]
            },
          ]
        },
        {
          "role": "text",
          "content": [
            {
              "code": "en",
              "parts": ["Select all options that apply, if any"]
            },
          ]
        }
      ];
      print("Items=" + items.toString());
    });
    test('Check if English parts are fetched from `text`', () {
      dynamic expected = {
        "role": "title",
        "content": [
          {
            "code": "en",
            "parts": ["Survey question 1"]
          },
        ]
      };
      expect(json.encode(Utils.getSingleItemComponentsByRole(items, 'title')),
          json.encode(expected));
    });
  });

  group('\n\nTest if content of a role is fetched appropriately :\n', () {
    dynamic components;
    setUp(() {
      components = {
        "role": "text",
        "content": [
          {
            "code": "en",
            "parts": ["Select all options that apply, if any"]
          },
          {
            "code": "de",
            "parts": [
              "Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen"
            ]
          }
        ]
      };
      print("Components=" + components.toString());
    });
    test('Check if null is returned if itemComponents are null', () {
      expect(Utils.getContent(null), '');
    });
    test('Check if null is returned if content is null', () {
      expect(Utils.getContent({'content': null}), '');
    });
    test('Check if English parts are fetched from `text`', () {
      expect(Utils.getContent(components),
          "Select all options that apply, if any");
    });

    test('Check if German parts are fetched from `text`', () {
      expect(Utils.getContent(components, code: 'de'),
          'Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen');
    });
  });

  group('\n\nTest if description of a role is fetched appropriately :\n', () {
    dynamic components;
    setUp(() {
      components = {
        "role": "text",
        "description": [
          {
            "code": "en",
            "parts": ["Select all options that apply, if any"]
          },
          {
            "code": "de",
            "parts": [
              "Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen"
            ]
          }
        ]
      };
      print("Components=" + components.toString());
    });
    test('Check if null is returned if itemComponents are null', () {
      expect(Utils.getDescription(null), '');
    });
    test('Check if null is returned if description is null', () {
      expect(Utils.getDescription({'description': null}), '');
    });
    test('Check if English parts are fetched from `text`', () {
      expect(Utils.getDescription(components),
          "Select all options that apply, if any");
    });

    test('Check if German parts are fetched from `text`', () {
      expect(Utils.getDescription(components, code: 'de'),
          'Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen');
    });
  });

  group(
      '\n\nTest if Localised strings are fetched from rendered survey content :\n',
      () {
    List content;
    setUp(() {
      content = [
        {
          "code": "en",
          "parts": ["What is your main activity?"]
        },
        {
          "code": "de",
          "parts": ["Was ist Ihre Haupttätigkeit?"]
        }
      ];
      print(json.encode(content));
    });
    test('Check if empty string is returned if content is null', () {
      expect(Utils.getPartsByCode(null, code: "en"), '');
    });
    test('Check if English parts are fetched', () {
      expect(Utils.getPartsByCode(content, code: "en"),
          'What is your main activity?');
    });
    test('Check if German parts are fetched', () {
      expect(Utils.getPartsByCode(content, code: "de"),
          'Was ist Ihre Haupttätigkeit?');
    });
  });
}
