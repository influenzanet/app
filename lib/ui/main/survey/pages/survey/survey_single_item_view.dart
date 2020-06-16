import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/body_component.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/question.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class SurveySingleItemView extends StatelessWidget {
  final SurveySingleItem surveyItem;
  SurveySingleItemView({Key key, this.surveyItem});

  @override
  Widget build(BuildContext context) {
    dynamic surveySingleItem = surveyItem.surveySingleItem;
    dynamic question = Utils.getSingleItemComponentsByRole(
        surveySingleItem['components']['items'], 'title');
    dynamic bodyComponent = surveySingleItem['components']['items'];
    return Form(
      child: Container(
        child: Column(
          children: <Widget>[
            ThemedCard(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Question(questionComponent: question)),
                          IconButton(
                            icon: Icon(Icons.info_outline),
                            alignment: Alignment.topRight,
                            onPressed: () async {
                              _showHelpGroup(
                                  context,
                                  Utils.getSingleItemComponentsByRole(
                                      surveySingleItem['components']['items'],
                                      'helpGroup'));
                            },
                          ),
                        ]),
                    Container(
                      height: ThemeElements.cardContentPadding,
                    ),
                    Body(
                        bodyComponent: bodyComponent,
                        surveyKey: surveySingleItem['key']),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showHelpGroup(context, dynamic helpGroup) async {
    List<Widget> helpWidgets =
        WidgetUtils.getHelpGroupContents(helpGroup, context);
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Help',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: helpWidgets,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
