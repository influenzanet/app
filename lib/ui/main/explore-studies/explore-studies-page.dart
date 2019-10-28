import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/studies/study-item.dart';
import 'package:flutter/material.dart';

class ExploreStudiesPage extends ListPage {
  ExploreStudiesPage() : super(titleText: 'Explore');

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      _studyItem(false),
    ];
  }

  Widget _studyItem(bool subscribed) {
    return Padding(
      padding: ThemeElements.listPageItemEdgeInsets,
      child: StudyItem(
        subscribed: subscribed,
      ),
    );
  }
}
