import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExitSurveyButton extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        padding: EdgeInsets.only(right: 5.0),
        iconSize: 30.0,
        icon: Icon(
          Icons.close,
          color: Colors.red,
          semanticLabel: "Stop the Survey",
        ),
        onPressed: () {
          MainNavigator.navigatorKey.currentState.pushNamed(MainNavigator.homeRoute);
        },
      ),
    );
  }
}
