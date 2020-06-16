import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberInput extends StatelessWidget {
  final String itemKey;
  final dynamic inputComponent;
  final String surveyKey;

  final myController = TextEditingController();

  NumberInput({Key key, this.itemKey, this.inputComponent, this.surveyKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemedTextFormField(
      keyboardType: TextInputType.number,
      onFieldSubmitted: (String value) {
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .setResponded(surveyKey);
        debugPrint('Input saved: ' + value);
        // SurveySingleItemProvider surveySingleItemProvider =
        //     Provider.of<SurveySingleItemProvider>(context, listen: false);
        // dynamic response = Utils.constructSingleResponseItem(
        //     key: itemKey,
        //     value: value,
        //     responseItem: surveySingleItemProvider.responseItem);
        // surveySingleItemProvider.responseItem = response;
      },
      controller: myController,
    );
  }
}
