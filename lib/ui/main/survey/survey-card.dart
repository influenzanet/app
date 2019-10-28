import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:flutter/material.dart';

import '../main-navigator.dart';

class SurveyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedCard(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(MainNavigator.surveryRoute);
      },
      child: Padding(
        padding: const EdgeInsets.all(ThemeElements.cardContentPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Weekly Influenza Survey',
                  style: themeData.textTheme.title,
                ),
                Text(
                  'Influenza Incidents Study',
                  style: themeData.textTheme.caption,
                ),
              ],
            ),
            Container(
              height: ThemeElements.cardElementPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '90',
                  style: themeData.textTheme.title.apply(fontSizeDelta: -2, fontWeightDelta: -1),
                ),
                Text(
                  ' Seconds',
                  style: themeData.textTheme.title.apply(fontSizeDelta: -4, fontWeightDelta: -1),
                ),
                // //Container(width: 20),
                // Text(
                //   'Due: ',
                //   style: themeData.textTheme.body1,
                // ),
                // Text(
                //   '06.11.2019',
                //   style: themeData.textTheme.body1,
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
