import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedTextFormField extends TextFormField {
  ThemedTextFormField(
      {String initialValue,
      String hintText,
      bool obscureText = false,
      TextInputType keyboardType,
      bool readOnly: false,
      bool autocorrect: false,
      Function onFieldSubmitted,
      TextEditingController controller,
      bool enabled,
      TextStyle style})
      : super(
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: TextInputAction.done,
          controller: controller,
          initialValue: initialValue,
          style: style ?? ThemeElements.bigButtonTextStyle,
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
          keyboardAppearance: Brightness.light,
          readOnly: readOnly,
          autocorrect: autocorrect,
        );
}
