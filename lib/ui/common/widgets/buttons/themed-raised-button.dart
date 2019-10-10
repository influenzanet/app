import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedRaisedButton extends RaisedButton {
  factory ThemedRaisedButton(ThemeData themeData,
      {String text = '', void Function() onPressed, bool primaryColor = true}) {
    return ThemedRaisedButton.widget(
      themeData,
      primaryColor: primaryColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: ThemeElements.bigButtonTextStyle.apply(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }

  ThemedRaisedButton.widget(ThemeData themeData, {Widget child, void Function() onPressed, bool primaryColor = true})
      : super(
          color: primaryColor ? themeData.primaryColor : themeData.accentColor,
          splashColor: primaryColor ? ThemeElements.primarySwatch[500] : ThemeElements.accentSwatch[400],
          padding: ThemeElements.bigButtonPaddingGeometry,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: child,
          onPressed: onPressed,
        );
}
