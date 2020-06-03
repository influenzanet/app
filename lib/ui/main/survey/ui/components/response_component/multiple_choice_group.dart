import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultipleChoiceGroup extends StatefulWidget {
  final dynamic multipleChoiceGroupComponent;
  final String itemKey;
  MultipleChoiceGroup(
      {Key key, this.multipleChoiceGroupComponent, this.itemKey})
      : super(key: key);

  @override
  _MultipleChoiceGroupState createState() => _MultipleChoiceGroupState();
}

class _MultipleChoiceGroupState extends State<MultipleChoiceGroup> {
  Map<String, bool> optionValues = {};
  String itemKey;

  dynamic multipleChoiceGroupComponent;
  List choiceList;

  @override
  void initState() {
    multipleChoiceGroupComponent = widget.multipleChoiceGroupComponent;
    itemKey = widget.itemKey;
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
        title: WidgetUtils.classifyMultipleChoiceGroupComponent(item),
        value: optionValues[key],
        onChanged: (bool value) {
          setState(() {
            optionValues[key] = value;
            debugPrint(optionValues.toString());
            ResponseModel responseModel =
                Provider.of<ResponseModel>(context, listen: false);
            dynamic response = Utils.constructMultipleChoiceGroupItem(
                groupKey: itemKey,
                keys: optionValues.keys
                    .where((k) => optionValues[k] == true)
                    .toList(),
                responseItem: responseModel.getResponseItem());

            responseModel.setResponseItem(response);
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
      padding: const EdgeInsets.all(2.0),
      child: SingleChildScrollView(
        child: ListBody(
          children: choiceItemsWidget(),
        ),
      ),
    );
  }
}
