import 'package:InfluenzaNet/ui/common/widgets/forms/themed-long-text-form-field.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultilineInput extends StatefulWidget {
  final String text;
  final dynamic inputComponent;

  MultilineInput({this.text, this.inputComponent});
  @override
  _MultilineInputState createState() => _MultilineInputState();
}

class _MultilineInputState extends State<MultilineInput> {
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
    return ThemedLongTextFormField(
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
