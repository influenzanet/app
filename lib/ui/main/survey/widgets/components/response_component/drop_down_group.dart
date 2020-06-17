import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/providers/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownGroup extends StatelessWidget {
  final dynamic dropDownGroupComponent;
  final String surveyKey;

  DropDownGroup({Key key, this.dropDownGroupComponent, this.surveyKey})
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
    SurveySingleItemModel surveySingleItemModel =
        Provider.of<SurveyPageViewProvider>(context, listen: false)
            .getSurveyItemByKey(surveyKey);
    dynamic preset = surveySingleItemModel.preset;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  Utils.getDescription(dropDownGroupComponent) ?? '',
                  textAlign: TextAlign.center,
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
                    value: ((preset == null) ? null : preset['key']),
                    underline: Container(
                      height: 2,
                      color: Colors.black87,
                    ),
                    onChanged: (newValue) {
                      dynamic valuePair = {'key': newValue, 'value': null};
                      dynamic response = Utils.constructSingleChoiceGroupItem(
                          groupKey: dropDownGroupComponent['key'],
                          valuePair: valuePair,
                          responseItem:
                              surveySingleItemModel.getResponseItem());
                      Provider.of<SurveyPageViewProvider>(context,
                              listen: false)
                          .setResponded(surveyKey,
                              presetValue: valuePair, responseItem: response);
                    },
                    items: choiceItemsWidget(dropDownGroupComponent['items']),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
