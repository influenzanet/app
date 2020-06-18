import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
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
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;
    String itemGroupKey = singleChoiceGroupComponent['key'];
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = RadioListTile(
        groupValue: ((preset == null) ? null : preset['key']),
        title: WidgetUtils.classifySingleChoiceGroupComponent(
            choiceComponent: item,
            groupKey: itemGroupKey,
            itemKey: item['key'],
            content: Utils.getContent(item),
            surveyKey: surveyKey),
        value: item['key'],
        onChanged: (newValue) {
          dynamic valuePair = {'key': newValue, 'value': null};
          dynamic response = Utils.constructSingleChoiceGroupItem(
              groupKey: itemGroupKey,
              valuePair: valuePair,
              responseItem: surveySingleItemModel.getResponseItem());
          Provider.of<SurveyPageViewProvider>(context, listen: false)
              .setResponded(surveyKey,
                  presetValue: valuePair, responseItem: response);
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
