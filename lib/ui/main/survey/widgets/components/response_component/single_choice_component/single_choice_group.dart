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

  void _submitResponse(BuildContext context, String newValue,
      dynamic presetValue, SurveySingleItemModel surveySingleItemModel) {
    dynamic newPresetPair = {
      'groupKey': singleChoiceGroupComponent['key'],
      'key': newValue,
      'value': null
    };
    if (presetValue == null) {
      presetValue = [];
      presetValue.add(newPresetPair);
    } else {
      int position = presetValue.indexWhere(
          (pre) => pre['groupKey'] == singleChoiceGroupComponent['key']);
      if (position == -1) {
        presetValue.add(newPresetPair);
      } else {
        presetValue[position] = newPresetPair;
      }
    }
    dynamic valuePair = {'key': newValue, 'value': null};
    dynamic response = Utils.constructSingleChoiceGroupItem(
        groupKey: singleChoiceGroupComponent['key'],
        valuePair: valuePair,
        responseItem: surveySingleItemModel.getResponseItem());
    Provider.of<SurveyPageViewProvider>(context, listen: false).setResponded(
        surveyKey,
        presetValue: presetValue,
        responseItem: response);
  }

  List<Widget> _choiceItemsWidget(List itemList, BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic presetValue = surveySingleItemModel.preset;
    dynamic preset;
    if (presetValue == null) {
      preset = null;
    } else {
      preset = presetValue.singleWhere(
          (pre) => pre['groupKey'] == singleChoiceGroupComponent['key'],
          orElse: () => null);
    }
    String itemGroupKey = singleChoiceGroupComponent['key'];
    List<Widget> result = [];
    itemList.forEach((item) {
      bool disabled = item['disabled'] ?? false;
      Widget itemWidget;
      if (disabled == true) {
        itemWidget = RadioListTile(
          groupValue: ((preset == null) ? null : preset['key']),
          title: WidgetUtils.classifySingleChoiceGroupComponent(
              choiceComponent: item,
              groupKey: itemGroupKey,
              itemKey: item['key'],
              content: Utils.getContent(item),
              surveyKey: surveyKey,
              disabled: true),
          value: item['key'],
          onChanged: null,
        );
      } else {
        itemWidget = RadioListTile(
          groupValue: ((preset == null) ? null : preset['key']),
          title: WidgetUtils.classifySingleChoiceGroupComponent(
              choiceComponent: item,
              groupKey: itemGroupKey,
              itemKey: item['key'],
              content: Utils.getContent(item),
              surveyKey: surveyKey),
          value: item['key'],
          onChanged: (newValue) => _submitResponse(
              context, newValue, presetValue, surveySingleItemModel),
        );
      }
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
              _choiceItemsWidget(singleChoiceGroupComponent['items'], context),
        ),
      ),
    );
  }
}
