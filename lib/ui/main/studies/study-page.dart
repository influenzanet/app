import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/lists/horizontal-list.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/survey-card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyPage extends ListPage {
  final bool subscribed;

  StudyPage({this.subscribed = false})
      : super(
            titleWidget: Image.asset(
              'assets/images/logos/influenzanet_small.png',
              height: 36,
            ),
            drawer: false);

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
            child: Column(
              children: <Widget>[
                _name(themeData),
                _organizer(themeData),
                Container(height: ThemeElements.connectedElementPadding),
                _tags(themeData),
                Container(height: ThemeElements.elementPadding),
                _infoCard(themeData),
              ],
            ),
          ),
          Container(height: ThemeElements.elementPadding),
          if (subscribed) _surveys(themeData),
        ],
      ),
    ];
  }

  Widget _name(ThemeData themeData) {
    return Text(
      'Influenza Incidents',
      style: themeData.textTheme.display1,
      textAlign: TextAlign.center,
    );
  }

  Widget _organizer(ThemeData themeData) {
    return Text(
      'ABC Research Group',
      style: themeData.textTheme.subhead,
      textAlign: TextAlign.center,
    );
  }

  Widget _tags(ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _tag(themeData, 'Influenza'),
        Container(
          width: 4,
        ),
        _tag(themeData, 'Open Research'),
      ],
    );
  }

  Widget _tag(ThemeData themeData, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(color: themeData.accentColor, borderRadius: BorderRadius.circular(500)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _surveys(ThemeData themeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        HorizontalList(
          titleText: 'New Surveys',
          height: 105,
          titleTextStyle: themeData.textTheme.display1.copyWith(fontSize: 24, color: themeData.primaryColor),
          viewAllButtonLayout: false,
          children: <Widget>[
            _surveyItem(),
            _surveyItem(),
            _surveyItem(),
          ],
        ),
        Container(
          height: ThemeElements.elementPadding,
        ),
        HorizontalList(
          titleText: 'Incomplete Surveys',
          height: 105,
          titleTextStyle: themeData.textTheme.display1.copyWith(fontSize: 24, color: Colors.red),
          viewAllButtonLayout: false,
          children: <Widget>[
            _surveyItem(),
            _surveyItem(),
          ],
        ),
        Container(height: ThemeElements.elementPadding),
      ],
    );
  }

  Widget _surveyItem() {
    return Padding(
      padding: EdgeInsets.all(ThemeElements.listItemPadding),
      child: SurveyCard(),
    );
  }

  Widget _infoCard(ThemeData themeData) {
    return ThemedCard(
      child: Padding(
        padding: const EdgeInsets.all(ThemeElements.cardContentPadding),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Text(
                'https://influenzanet.github.io',
                style: TextStyle(
                  color: themeData.accentColor,
                ),
              ),
              onTap: () {
                launch('https://influenzanet.github.io');
              },
            ),
            Container(
              height: ThemeElements.cardElementPadding,
            ),
            Text(
              'The Influenza Incidents study is a world wide study conducted by a renowned group of leading medical scientists. It strives to analyze Influenza-Like-Illnesses (ILI) on an unpredecented scale to develop new methods to reduce influenza incidents and their severity. All data will be made available to governments, medical institutions and researchers worldwide. Join now into this global effort!',
              style: themeData.textTheme.body1,
              textAlign: TextAlign.justify,
            ),
            Container(
              height: ThemeElements.cardElementPadding,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                Text(
                  'Start Date: ',
                  style: themeData.textTheme.caption,
                ),
                Text(
                  ' 01.02.2019',
                  style: themeData.textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'End Date:',
                  style: themeData.textTheme.caption,
                ),
                Text(
                  ' 01.02.2022',
                  style: themeData.textTheme.caption.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _participants(ThemeData themeData) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '337',
          textAlign: TextAlign.center,
          style: themeData.textTheme.title.apply(color: themeData.accentColor),
        ),
        Text(
          ' Participants',
          textAlign: TextAlign.center,
          style: themeData.textTheme.title,
        ),
      ],
    );
  }

  Widget _subscriptionButton(ThemeData themeData) {
    return (subscribed)
        ? ThemedSecondaryButton.big(themeData, text: 'Leave Study', onPressed: () {})
        : ThemedPrimaryButton(
            themeData,
            text: 'Join Study',
            onPressed: () {},
          );
  }

  @override
  Widget buildBottomWidget(BuildContext context, ThemeData themeData) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        _participants(themeData),
        Container(height: ThemeElements.elementPadding),
        _subscriptionButton(themeData),
      ],
    );
  }
}
