import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownGroup extends StatelessWidget {
  final String optionValue;
  final dynamic dropDownGroupComponent;
  final String itemGroupKey;
  final String surveyKey;

  DropDownGroup(
      {Key key,
      this.optionValue,
      this.dropDownGroupComponent,
      this.itemGroupKey,
      this.surveyKey})
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
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: SingleChildScrollView(
        child: ListBody(children: <Widget>[
          DropdownButton<String>(
            isExpanded: true,
            value: optionValue,
            underline: Container(
              height: 2,
              color: Colors.black87,
            ),
            onChanged: (newValue) {
              Provider.of<SurveyPageViewProvider>(context, listen: false)
                  .setResponded(surveyKey);
            },
            items: choiceItemsWidget(dropDownGroupComponent['items']),
          )
        ]),
      ),
    );
  }
}
