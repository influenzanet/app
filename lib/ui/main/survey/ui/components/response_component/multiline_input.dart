import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
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
    return TextFormField(
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (String value) {
        debugPrint('MultilineInput saved');
        SurveySingleItemProvider surveySingleItemProvider =
            Provider.of<SurveySingleItemProvider>(context, listen: false);
        dynamic response = Utils.constructSingleResponseItem(
            key: itemKey,
            value: value,
            responseItem: surveySingleItemProvider.responseItem);
        surveySingleItemProvider.responseItem = response;
      },
      controller: myController,
      style: ThemeElements.longTextFormFieldTextStyle,
      decoration: InputDecoration(
        hintStyle: ThemeElements.longTextFormFieldTextStyle,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        filled: true,
        focusColor: ThemeElements.primaryColorLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      keyboardAppearance: Brightness.light,
    );
  }
}
