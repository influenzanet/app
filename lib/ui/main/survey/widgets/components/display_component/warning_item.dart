import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class WarningItem extends StatelessWidget {
  final dynamic warningComponent;
  const WarningItem({Key key, this.warningComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.warningComponent),
        style: ThemeElements.warningTextStyle);
  }
}
