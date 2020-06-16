import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:flutter/material.dart';

class CheckBoxInput extends StatelessWidget {
  final String groupKey;
  final String itemKey;
  final String content;
  final myController = TextEditingController();

  CheckBoxInput({Key key, this.groupKey, this.itemKey, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content),
        Expanded(
          child: ThemedTextFormField(
            onFieldSubmitted: (String value) {
              // // Provider.of<InputChoiceProvider>(context, listen: false).inputKey =
              // //     itemKey;
              // SurveySingleItemProvider surveySingleItemProvider =
              //     Provider.of<SurveySingleItemProvider>(context, listen: false);
              // dynamic response = Utils.constructMultipleChoiceInputGroupItem(
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
