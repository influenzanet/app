import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  final dynamic textComponent;
  const TextItem({Key key, this.textComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.textComponent));
  }
}
