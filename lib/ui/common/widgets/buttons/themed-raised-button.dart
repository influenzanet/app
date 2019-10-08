import 'package:flutter/material.dart';

class ThemedRaisedButton extends RaisedButton {
  factory ThemedRaisedButton(ThemeData themeData, {String text = '', void Function() onPressed}) {
    return ThemedRaisedButton.widget(
      themeData,
      child: Text(
        text,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
      ),
      onPressed: onPressed,
    );
  }

  ThemedRaisedButton.widget(ThemeData themeData, {Widget child, void Function() onPressed})
      : super(
          color: themeData.primaryColor,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: child,
          onPressed: onPressed,
        );
}
