import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/survey_item_view/survey_single_item_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstQuestionPage extends ListPage {
  final void Function() onAnswered;

  FirstQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  List<Widget> itemBuildArray({List array}) {
    List result = array
        .map((item) => Padding(
            padding: const EdgeInsets.only(
              left: ThemeElements.pagePadding,
              top: ThemeElements.pagePadding,
              right: ThemeElements.pagePadding,
            ),
            child: Container(
              child: SurveySingleItemView(surveyItem: item),
            )))
        .toList();
    return result;
  }

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      Container(
        child: Consumer<SurveyPageViewProvider>(
          builder: (context, items, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: itemBuildArray(array: items.surveyPageList),
          ),
        ),
      ),
    ];
  }

  @override
  Widget buildBottomWidget(BuildContext context, ThemeData themeData) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        Container(height: ThemeElements.elementPadding),
        ThemedPrimaryButton(
          themeData,
          text: 'Finish Survey',
          onPressed: () {
            debugPrint('Sending responses');
            dynamic responses =
                Provider.of<SurveyPageViewProvider>(context, listen: false)
                    .surveyEngineCore
                    .getResponses();
            debugPrint(responses.toString());
            onAnswered();
          },
        ),
      ],
    );
  }
}
