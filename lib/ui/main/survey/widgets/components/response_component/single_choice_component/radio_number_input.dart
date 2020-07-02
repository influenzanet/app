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

  void _submitResponse(
      {BuildContext context,
      String newValue,
      SurveySingleItemModel surveySingleItemModel,
      dynamic presetValue}) {
    dynamic valuePair = {'key': itemKey, 'value': newValue};
    presetValue = Utils.updateSingleChoicePresetValue(
        presetValue: presetValue,
        groupKey: itemGroupKey,
        key: itemKey,
        value: newValue);
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
    dynamic preset;
    String initialValue;
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    bool enabled = (!(disabled ?? false));
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic presetValue = surveySingleItemModel.preset;

    if (presetValue == null) {
      preset = null;
    } else {
      preset = presetValue.singleWhere((pre) => pre['groupKey'] == itemGroupKey,
          orElse: () => null);
    }

    if (disabled == true) {
      textTheme = themeData.textTheme.apply(
          displayColor: themeData.disabledColor,
          bodyColor: themeData.disabledColor);
      initialValue = '';
    } else {
      if (preset != null && preset['key'] == itemKey) {
        initialValue = preset['value'] ?? '';
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content ?? '', style: textTheme.bodyText2),
        Expanded(
          child: ThemedTextFormField(
            initialValue: initialValue,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (String newValue) => _submitResponse(
                context: context,
                newValue: newValue,
                surveySingleItemModel: surveySingleItemModel,
                presetValue: presetValue),
            enabled: enabled,
            style: textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
