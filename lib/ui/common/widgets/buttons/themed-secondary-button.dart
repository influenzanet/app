import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedSecondaryButton extends FlatButton {
  factory ThemedSecondaryButton(ThemeData themeData, {String text = '', void Function() onPressed}) {
    return ThemedSecondaryButton.widget(
      themeData,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
      onPressed: onPressed,
    );
  }

  factory ThemedSecondaryButton.big(ThemeData themeData, {String text = '', void Function() onPressed}) {
    return ThemedSecondaryButton.widget(
      themeData,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: ThemeElements.bigButtonTextStyle,
      ),
      padding: ThemeElements.bigButtonPaddingGeometry,
      onPressed: onPressed,
    );
  }

  ThemedSecondaryButton.widget(ThemeData themeData,
      {Widget child, void Function() onPressed, EdgeInsetsGeometry padding})
      : super(
          child: child,
          color: Colors.white,
          textColor: themeData.accentColor,
          splashColor: ThemeElements.accentSwatch[50],
          padding: padding,
          onPressed: () {},
        );
}
