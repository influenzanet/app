import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleChoiceGroup extends StatefulWidget {
  final dynamic singleChoiceGroupComponent;
  final String surveyKey;
  SingleChoiceGroup({Key key, this.singleChoiceGroupComponent, this.surveyKey})
      : super(key: key);

  @override
  _SingleChoiceGroupState createState() => _SingleChoiceGroupState();
}

class _SingleChoiceGroupState extends State<SingleChoiceGroup> {
  String optionValue;
  dynamic singleChoiceGroupComponent;
  String itemGroupKey;
  String surveyKey;

  @override
  void initState() {
    singleChoiceGroupComponent = widget.singleChoiceGroupComponent;
    itemGroupKey = singleChoiceGroupComponent['key'];
    surveyKey = widget.surveyKey;
    super.initState();
  }

  List<Widget> choiceItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = RadioListTile(
        groupValue: optionValue,
        title: WidgetUtils.classifySingleChoiceGroupComponent(
            choiceComponent: item, groupKey: itemGroupKey),
        value: item['key'],
        onChanged: (val) {
          setState(() {
            debugPrint('Selected value = $val');
            optionValue = val;
            SurveySingleItemProvider surveySingleItemProvider =
                Provider.of<SurveySingleItemProvider>(context, listen: false);
            dynamic response = Utils.constructSingleChoiceGroupItem(
                groupKey: itemGroupKey,
                key: val,
                responseItem: surveySingleItemProvider.responseItem);
            surveySingleItemProvider.responseItem = response;
            debugPrint('we are' + surveySingleItemProvider.surveyKey);
          });
        },
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
      child: SingleChildScrollView(
        child: ListBody(
          children: choiceItemsWidget(singleChoiceGroupComponent['items']),
        ),
      ),
    );
  }
}
