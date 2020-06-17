import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownGroup extends StatelessWidget {
  final String optionValue;
  final dynamic dropDownGroupComponent;
  final String surveyKey;

  DropDownGroup(
      {Key key, this.optionValue, this.dropDownGroupComponent, this.surveyKey})
      : super(key: key);

  List<DropdownMenuItem<String>> choiceItemsWidget(List itemList) {
    List<DropdownMenuItem<String>> result = [];
    itemList.forEach((item) {
      DropdownMenuItem<String> itemWidget = DropdownMenuItem<String>(
        value: item['key'],
        child: Text(Utils.getContent(item), textAlign: TextAlign.center),
      );
      if (itemWidget != null) {
        result.add(itemWidget);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
              Utils.getDescription(dropDownGroupComponent) ?? '',
              textAlign: TextAlign.right,
            ))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Text(
              Utils.getContent(dropDownGroupComponent) ?? '',
              textAlign: TextAlign.left,
            )),
            Expanded(
              child: DropdownButton<String>(
                value: null,
                underline: Container(
                  height: 2,
                  color: Colors.black87,
                ),
                onChanged: (newValue) {
                  Provider.of<SurveyPageViewProvider>(context, listen: false)
                      .setResponded(surveyKey);
                },
                items: choiceItemsWidget(dropDownGroupComponent['items']),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
