import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedLongTextFormField extends TextFormField {
  ThemedLongTextFormField(
      {String initialValue,
      String hintText,
      int maxlines,
      bool readOnly: false,
      bool autocorrect: false,
      Function onFieldSubmitted,
      TextEditingController controller})
      : super(
          initialValue: initialValue,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: TextInputAction.done,
          controller: controller,
          style: ThemeElements.longTextFormFieldTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: ThemeElements.longTextFormFieldTextStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            filled: true,
            focusColor: ThemeElements.primaryColorLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.multiline,
          keyboardAppearance: Brightness.light,
          maxLines: maxlines ?? 4,
          readOnly: readOnly,
          autocorrect: autocorrect,
        );
}
