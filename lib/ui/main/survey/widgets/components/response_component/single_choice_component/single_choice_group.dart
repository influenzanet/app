import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleChoiceGroup extends StatelessWidget {
  final dynamic singleChoiceGroupComponent;
  final String surveyKey;

  SingleChoiceGroup({Key key, this.singleChoiceGroupComponent, this.surveyKey})
      : super(key: key);

  List<Widget> choiceItemsWidget(List itemList, BuildContext context) {
    String itemGroupKey = singleChoiceGroupComponent['key'];
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = RadioListTile(
        groupValue: itemGroupKey,
        title: WidgetUtils.classifySingleChoiceGroupComponent(
            choiceComponent: item,
            groupKey: itemGroupKey,
            itemKey: item['key'],
            content: Utils.getContent(item)),
        value: item['key'],
        onChanged: (val) {
          itemGroupKey = val;
          Provider.of<SurveyPageViewProvider>(context, listen: false)
              .setResponded(surveyKey);
        },
      );

      if (itemWidget != null) {
        result.add(itemWidget);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ListBody(
          children:
              choiceItemsWidget(singleChoiceGroupComponent['items'], context),
        ),
      ),
    );
  }
}
