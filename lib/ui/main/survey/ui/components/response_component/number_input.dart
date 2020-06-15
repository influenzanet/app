import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final dynamic inputComponent;

  NumberInput({this.inputComponent});
  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  String itemKey;

  final myController = TextEditingController();

  @override
  void initState() {
    itemKey = widget.inputComponent['key'];

    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
