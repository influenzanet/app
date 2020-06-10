import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioInput extends StatefulWidget {
  final String groupKey;
  final String itemKey;

  RadioInput({this.groupKey, this.itemKey});
  @override
  _RadioInputState createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  String groupKey;
  String itemKey;
  final myController = TextEditingController();

  @override
  void initState() {
    groupKey = widget.groupKey;
    itemKey = widget.itemKey;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (String value) {
        // Provider.of<InputChoiceProvider>(context, listen: false).inputKey =
        //     itemKey;
        SurveySingleItemProvider surveySingleItemProvider =
            Provider.of<SurveySingleItemProvider>(context, listen: false);
        dynamic response = Utils.constructSingleChoiceInputGroupItem(
            groupKey: groupKey,
            key: itemKey,
            value: value,
            responseItem: surveySingleItemProvider.responseItem);
        surveySingleItemProvider.responseItem = response;
      },
      controller: myController,
      style: ThemeElements.hintTextStyle,
      decoration: InputDecoration(
        hintStyle: ThemeElements.hintTextStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        filled: true,
        focusColor: ThemeElements.primaryColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardAppearance: Brightness.light,
    );
  }
}
