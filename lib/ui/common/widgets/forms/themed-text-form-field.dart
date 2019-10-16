import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedTextFormField extends TextFormField {
  ThemedTextFormField(
      {String hintText,
      bool obscureText = false,
      TextInputType keyboardType,
      bool readOnly: false,
      bool autocorrect: false})
      : super(
          style: ThemeElements.bigButtonTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: ThemeElements.bigButtonTextStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            filled: true,
            focusColor: ThemeElements.primaryColorLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          autocorrect: autocorrect,
        );
}
