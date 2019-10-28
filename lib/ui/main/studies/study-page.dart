import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudyPage extends ScaffoldPage {
  final bool subscribed;

  StudyPage({this.subscribed = false})
      : super(
            titleWidget: Image.asset(
              'assets/images/logos/influenzanet_small.png',
              height: 36,
            ),
            drawer: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.all(ThemeElements.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Influenza Incidents',
            style: themeData.textTheme.display1,
            textAlign: TextAlign.center,
          ),
          Text(
            'ABC Research Group',
            style: themeData.textTheme.subhead,
            textAlign: TextAlign.center,
          ),
          Container(height: ThemeElements.connectedElementPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _tag(themeData, 'Influenza'),
              Container(
                width: 4,
              ),
              _tag(themeData, 'Open Research'),
            ],
          ),
          Container(height: ThemeElements.elementPadding),
          ThemedCard(
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
          ),
          Container(height: ThemeElements.elementPadding),
          Spacer(),
          Row(
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
          ),
          Container(height: ThemeElements.elementPadding),
          (subscribed)
              ? ThemedSecondaryButton.big(themeData, text: 'Leave Study', onPressed: () {})
              : ThemedPrimaryButton(
                  themeData,
                  text: 'Join Study',
                  onPressed: () {},
                ),
        ],
      ),
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
}
