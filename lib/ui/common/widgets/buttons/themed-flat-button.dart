import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedFlatButton extends FlatButton {
  factory ThemedFlatButton(ThemeData themeData, {String text = '', void Function() onPressed}) {
    return ThemedFlatButton.widget(
      themeData,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
      onPressed: onPressed,
    );
  }

  ThemedFlatButton.widget(ThemeData themeData, {Widget child, void Function() onPressed})
      : super(
          child: child,
          color: Colors.white,
          textColor: themeData.accentColor,
          splashColor: ThemeElements.accentSwatch[50],
          onPressed: () {},
        );
}
