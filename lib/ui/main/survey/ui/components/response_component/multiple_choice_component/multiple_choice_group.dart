import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class MultipleChoiceGroup extends StatefulWidget {
  final dynamic multipleChoiceGroupComponent;

  MultipleChoiceGroup({Key key, this.multipleChoiceGroupComponent})
      : super(key: key);

  @override
  _MultipleChoiceGroupState createState() => _MultipleChoiceGroupState();
}

class _MultipleChoiceGroupState extends State<MultipleChoiceGroup> {
  Map<String, bool> optionValues = {};
  String itemGroupKey;

  dynamic multipleChoiceGroupComponent;
  List choiceList;

  @override
  void initState() {
    multipleChoiceGroupComponent = widget.multipleChoiceGroupComponent;
    itemGroupKey = multipleChoiceGroupComponent['key'];
    choiceList = multipleChoiceGroupComponent['items'];

    choiceList.forEach((item) {
      String key = item['key'];
      optionValues[key] = false;
    });
    super.initState();
  }

  List<Widget> choiceItemsWidget() {
    List<Widget> result = [];
    choiceList.forEach((item) {
      String key = item['key'];
      Widget itemWidget = CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: WidgetUtils.classifyMultipleChoiceGroupComponent(
            choiceComponent: item,
            groupKey: itemGroupKey,
            itemKey: item['key'],
            content: Utils.getContent(item)),
        value: optionValues[key],
        onChanged: (bool value) {
          setState(() {
            // optionValues[key] = value;
            // debugPrint(optionValues.toString());
            // SurveySingleItemProvider surveySingleItemProvider =
            //     Provider.of<SurveySingleItemProvider>(context, listen: false);
            // dynamic response = Utils.constructMultipleChoiceGroupItem(
            //     groupKey: itemGroupKey,
            //     keys: optionValues.keys
            //         .where((k) => optionValues[k] == true)
            //         .toList(),
            //     responseItem: surveySingleItemProvider.responseItem);

            // surveySingleItemProvider.responseItem = response;
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
          children: choiceItemsWidget(),
        ),
      ),
    );
  }
}
