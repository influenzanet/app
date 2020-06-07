import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleChoiceGroup extends StatefulWidget {
  final dynamic singleChoiceGroupComponent;
  final String itemKey;
  SingleChoiceGroup({Key key, this.singleChoiceGroupComponent, this.itemKey})
      : super(key: key);

  @override
  _SingleChoiceGroupState createState() => _SingleChoiceGroupState();
}

class _SingleChoiceGroupState extends State<SingleChoiceGroup> {
  String optionValue;
  dynamic singleChoiceGroupComponent;
  String itemKey;

  @override
  void initState() {
    singleChoiceGroupComponent = widget.singleChoiceGroupComponent;
    itemKey = widget.itemKey;
    super.initState();
  }

  List<Widget> choiceItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = RadioListTile(
        groupValue: optionValue,
        title: WidgetUtils.classifySingleChoiceGroupComponent(
            choiceComponent: item, groupKey: itemKey, key: optionValue),
        value: item['key'],
        onChanged: (val) {
          setState(() {
            debugPrint('Selected value = $val');
            optionValue = val;
            ResponseModel responseModel =
                Provider.of<ResponseModel>(context, listen: false);
            dynamic response = Utils.constructSingleChoiceGroupItem(
                groupKey: itemKey,
                key: val,
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
      child: SingleChildScrollView(
        child: ListBody(
          children: choiceItemsWidget(singleChoiceGroupComponent['items']),
        ),
      ),
    );
  }
}
