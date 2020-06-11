import 'package:InfluenzaNet/ui/common/widgets/forms/themed-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Input extends StatefulWidget {
  final dynamic inputComponent;

  Input({this.inputComponent});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
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
      onFieldSubmitted: (String value) {
        debugPrint('Input saved: ' + value);
        SurveySingleItemProvider surveySingleItemProvider =
            Provider.of<SurveySingleItemProvider>(context, listen: false);
        dynamic response = Utils.constructSingleResponseItem(
            key: itemKey,
            value: value,
            responseItem: surveySingleItemProvider.responseItem);
        surveySingleItemProvider.responseItem = response;
      },
      controller: myController,
    );
  }
}
