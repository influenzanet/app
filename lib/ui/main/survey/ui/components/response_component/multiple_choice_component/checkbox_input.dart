import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBoxInput extends StatefulWidget {
  final String groupKey;
  final String itemKey;
  final String content;

  CheckBoxInput({this.groupKey, this.itemKey, this.content});
  @override
  _CheckBoxInputState createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  String groupKey;
  String itemKey;
  String content;
  final myController = TextEditingController();

  @override
  void initState() {
    groupKey = widget.groupKey;
    itemKey = widget.itemKey;
    content = widget.content;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(content),
        Expanded(
          child: TextFormField(
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (String value) {
              // // Provider.of<InputChoiceProvider>(context, listen: false).inputKey =
              // //     itemKey;
              SurveySingleItemProvider surveySingleItemProvider =
                  Provider.of<SurveySingleItemProvider>(context, listen: false);
              dynamic response = Utils.constructMultipleChoiceInputGroupItem(
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
          ),
        ),
      ],
    );
  }
}
