import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final dynamic errorComponent;
  const ErrorComponent({Key key, this.errorComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.errorComponent),
        style: ThemeElements.errorTextStyle);
  }
}
