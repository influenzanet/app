import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/studies/study-card.dart';
import 'package:flutter/material.dart';

class MyStudiesPage extends ListPage {
  MyStudiesPage() : super(titleText: 'My Studies');

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      _studyItem(true),
    ];
  }

  Widget _studyItem(bool subscribed) {
    return Padding(
      padding: ThemeElements.listPageItemEdgeInsets,
      child: StudyCard(
        subscribed: subscribed,
      ),
    );
  }
}
