import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExitSurveyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 15),
        child: InkWell(
          onTap: () {},
          child: Text(
            "Exit",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
