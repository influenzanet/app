import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';

class QuestionPage extends ScaffoldPage {
  final void Function() onAnswered;

  QuestionPage({@required this.onAnswered}) : super(titleText: 'Survey', drawer: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.all(ThemeElements.pagePadding),
      child: ThemedPrimaryButton(
        themeData,
        primaryColor: false,
        text: 'Next',
        onPressed: onAnswered,
      ),
    );
  }
}
