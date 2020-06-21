import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultipleChoiceGroup extends StatelessWidget {
  final dynamic multipleChoiceGroupComponent;
  final String surveyKey;

  MultipleChoiceGroup(
      {Key key, this.multipleChoiceGroupComponent, this.surveyKey})
      : super(key: key);

  List<Widget> _choiceItemsWidget(List choiceList, BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;
    String itemGroupKey = multipleChoiceGroupComponent['key'];
    List<Widget> result = [];
    Map<String, bool> optionValues = {};
    if (preset == [] || preset == null) {
      choiceList.forEach((item) {
        optionValues[item['key'].toString()] = false;
      });
    } else {
      choiceList.forEach((item) {
        String key = item['key'];
        var setValuePair =
            preset.singleWhere((vp) => vp['key'] == key, orElse: () => null);
        if (setValuePair == null) {
          optionValues[key] = false;
        } else {
          optionValues[key] = true;
        }
      });
    }
    choiceList.forEach((item) {
      String key = item['key'];
      Widget itemWidget = CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: WidgetUtils.classifyMultipleChoiceGroupComponent(
            choiceComponent: item,
            groupKey: itemGroupKey,
            itemKey: item['key'],
            content: Utils.getContent(item),
            surveyKey: surveyKey),
        value: optionValues[key],
        onChanged: (bool value) {
          optionValues[key] = !optionValues[key];
          List activeKeys =
              optionValues.keys.where((k) => optionValues[k] == true).toList();
          List valuePairs =
              activeKeys.map((key) => {'key': key, 'value': null}).toList();
          dynamic response = Utils.constructMultipleChoiceGroupItem(
              groupKey: itemGroupKey,
              valuePairs: valuePairs,
              responseItem: surveySingleItemModel.getResponseItem());
          Provider.of<SurveyPageViewProvider>(context, listen: false)
              .setResponded(surveyKey,
                  presetValue: valuePairs, responseItem: response);
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
            children: _choiceItemsWidget(
                multipleChoiceGroupComponent['items'], context)),
      ),
    );
  }
}
