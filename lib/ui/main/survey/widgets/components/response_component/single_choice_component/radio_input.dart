import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioInput extends StatelessWidget {
  final String itemGroupKey;
  final String itemKey;
  final String content;
  final String surveyKey;

  RadioInput(
      {Key key, this.itemGroupKey, this.itemKey, this.content, this.surveyKey})
      : super(key: key);

  void _submitResponse(BuildContext context, String value,
      SurveySingleItemModel surveySingleItemModel) {
    dynamic valuePair = {'key': itemKey, 'value': value};
    dynamic response = Utils.constructSingleChoiceGroupItem(
        groupKey: itemGroupKey,
        valuePair: valuePair,
        responseItem: surveySingleItemModel.getResponseItem());
    Provider.of<SurveyPageViewProvider>(context, listen: false).setResponded(
        surveyKey,
        presetValue: valuePair,
        responseItem: response);
  }

  @override
  Widget build(BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content),
        Expanded(
          child: ThemedTextFormField(
            initialValue: (preset == null || preset['key'] != itemKey)
                ? null
                : preset['value'] ?? '',
            onFieldSubmitted: (String value) =>
                _submitResponse(context, value, surveySingleItemModel),
          ),
        ),
      ],
    );
  }
}
