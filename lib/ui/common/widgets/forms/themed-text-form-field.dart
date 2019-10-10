import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedTextFormField extends TextFormField {
  ThemedTextFormField({String hintText})
      : super(
          style: TextStyle(fontSize: 24.0),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 24.0),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              filled: true,
              focusColor: ThemeElements.primaryColorLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide.none,
              )),
        );
}
