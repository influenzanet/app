import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final String itemKey;
  final dynamic inputComponent;

  final myController = TextEditingController();

  NumberInput({Key key, this.itemKey, this.inputComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemedTextFormField(
      keyboardType: TextInputType.number,
      onFieldSubmitted: (String value) {
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
