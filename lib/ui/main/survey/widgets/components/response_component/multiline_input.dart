import 'package:InfluenzaNet/ui/common/widgets/forms/themed-long-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultilineInput extends StatelessWidget {
  final String itemKey;
  final dynamic inputComponent;
  final String surveyKey;

  final myController = TextEditingController();

  MultilineInput({Key key, this.itemKey, this.inputComponent, this.surveyKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;
    return ThemedLongTextFormField(
      initialValue: (preset == null) ? null : preset['value'],
      onFieldSubmitted: (String value) {
        dynamic valuePair = {'key': inputComponent['key'], 'value': value};
        dynamic response = Utils.constructSingleValueResponseItem(
            valuePair: valuePair,
            responseItem: surveySingleItemModel.getResponseItem());
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .setResponded(surveyKey,
                presetValue: valuePair, responseItem: response);
      },
      controller: myController,
    );
  }
}
