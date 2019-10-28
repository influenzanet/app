import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/survey-card.dart';
import 'package:flutter/material.dart';

class NotificationPage extends ListPage {
  NotificationPage() : super(titleText: 'Notifications', drawer: false, notificationButton: false);

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      Padding(
        padding: ThemeElements.listPageItemEdgeInsets,
        child: SurveyCard(),
      ),
    ];
  }
}
