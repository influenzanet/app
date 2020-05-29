import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:flutter/material.dart';

class SurveyWelcomePage extends ListPage {
  final void Function() onStart;

  SurveyWelcomePage({@required this.onStart})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: ThemeElements.pagePadding,
              top: ThemeElements.pagePadding,
              right: ThemeElements.pagePadding,
            ),
            child: WelcomeCard(),
          ),
        ],
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
          primaryColor: true,
          text: 'Start the Survey',
          onPressed: onStart,
        ),
      ],
    );
  }
}

class WelcomeCard extends StatelessWidget {
  static final String title = 'Welcome to Influenza Survey';
  static final String message =
      'Thank you for every second invested in our research. With this survey, we would like to find out the influenza spreading in Germany';

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: themeData.textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: ThemeElements.cardContentPadding,
            ),
            Text(
              message,
              style: themeData.textTheme.caption.copyWith(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            Container(
              height: ThemeElements.cardContentPadding,
            ),
          ],
        ),
      ),
    );
  }
}
