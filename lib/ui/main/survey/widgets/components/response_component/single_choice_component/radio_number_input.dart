import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioNumberInput extends StatelessWidget {
  final String itemGroupKey;
  final String itemKey;
  final String content;
  final String surveyKey;
  final bool disabled;

  RadioNumberInput(
      {Key key,
      this.itemGroupKey,
      this.itemKey,
      this.content,
      this.surveyKey,
      this.disabled})
      : super(key: key);

  void _submitResponse(BuildContext context, String newValue,
      SurveySingleItemModel surveySingleItemModel, dynamic presetValue) {
    dynamic valuePair = {'key': itemKey, 'value': newValue};
    dynamic newPresetPair = {
      'groupKey': itemGroupKey,
      'key': itemKey,
      'value': newValue
    };
    if (presetValue == null) {
      presetValue = [];
      presetValue.add(newPresetPair);
    } else {
      int position =
          presetValue.indexWhere((pre) => pre['groupKey'] == itemGroupKey);
      if (position == -1) {
        presetValue.add(newPresetPair);
      } else {
        presetValue[position] = newPresetPair;
      }
    }
    dynamic response = Utils.constructSingleChoiceGroupItem(
        groupKey: itemGroupKey,
        valuePair: valuePair,
        responseItem: surveySingleItemModel.getResponseItem());
    Provider.of<SurveyPageViewProvider>(context, listen: false).setResponded(
        surveyKey,
        presetValue: presetValue,
        responseItem: response);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    if (disabled == true) {
      textTheme = themeData.textTheme.apply(
          displayColor: themeData.disabledColor,
          bodyColor: themeData.disabledColor);
    }
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic presetValue = surveySingleItemModel.preset;
    dynamic preset = surveySingleItemModel.preset;
    if (presetValue == null) {
      preset = null;
    } else {
      preset = presetValue.singleWhere((pre) => pre['groupKey'] == itemGroupKey,
          orElse: () => null);
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content ?? '', style: textTheme.bodyText2),
        Expanded(
          child: ThemedTextFormField(
            enabled: (!(disabled ?? false)),
            keyboardType: TextInputType.number,
            initialValue: (preset == null || preset['key'] != itemKey)
                ? null
                : preset['value'] ?? '',
            onFieldSubmitted: (String value) => _submitResponse(
                context, value, surveySingleItemModel, presetValue),
          ),
        ),
      ],
    );
  }
}
