import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  final dynamic errorComponent;
  const ErrorItem({Key key, this.errorComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.errorComponent),
        style: TextStyle(color: Colors.red));
  }
}
