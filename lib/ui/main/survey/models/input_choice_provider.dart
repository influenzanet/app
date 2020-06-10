import 'package:flutter/material.dart';

class InputChoiceProvider with ChangeNotifier {
  String _key;
  String _value;
  InputChoiceProvider({String key, String value}) {
    this._key = key;
    this._value = value;
  }
  String get inputKey {
    return _key;
  }

  String get inputValue => _value;

  set inputKey(String key) {
    _key = key;
    debugPrint('Input key=' + _key);
    notifyListeners();
  }

  set inputValue(String value) {
    _value = value;
    notifyListeners();
  }
}
