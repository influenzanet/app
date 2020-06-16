import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioNumberInput extends StatelessWidget {
  final String groupKey;
  final String itemKey;
  final String content;
  final String surveyKey;

  final myController = TextEditingController();

  RadioNumberInput(
      {Key key, this.groupKey, this.itemKey, this.content, this.surveyKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content),
        Expanded(
          child: ThemedTextFormField(
            keyboardType: TextInputType.number,
            onFieldSubmitted: (String value) {
              Provider.of<SurveyPageViewProvider>(context, listen: false)
                  .setResponded(surveyKey);
              // // Provider.of<InputChoiceProvider>(context, listen: false).inputKey =
              // //     itemKey;
              // SurveySingleItemProvider surveySingleItemProvider =
              //     Provider.of<SurveySingleItemProvider>(context, listen: false);
              // dynamic response = Utils.constructSingleChoiceInputGroupItem(
              //     groupKey: groupKey,
              //     key: itemKey,
              //     value: value,
              //     responseItem: surveySingleItemProvider.responseItem);
              // surveySingleItemProvider.responseItem = response;
            },
            controller: myController,
          ),
        ),
      ],
    );
  }
}
