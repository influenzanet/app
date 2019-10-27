import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:flutter/material.dart';

class StudyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedCard(
      color: Colors.white,
      onTap: () {
        Navigator.of(context).pushNamed(MainNavigator.studyRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(ThemeElements.cardContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logos/influenzanet_small.png',
                  width: 32,
                  height: 32,
                ),
                Container(
                  width: ThemeElements.cardContentPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Influenza Incidents',
                      style: themeData.textTheme.title,
                    ),
                    Text(
                      'ABC Research Group',
                      style: themeData.textTheme.caption.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '337',
                      style: themeData.textTheme.title.apply(color: themeData.accentColor, fontSizeDelta: -2),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      'Participants',
                      style: themeData.textTheme.caption,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: ThemeElements.cardElementPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _tag(themeData, 'Influenza'),
                Container(
                  width: 4,
                ),
                _tag(themeData, 'Open Research'),
              ],
            ),
          ],
        ),
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
