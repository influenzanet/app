import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class DropDownGroup extends StatefulWidget {
  final dynamic dropDownGroupComponent;

  DropDownGroup({Key key, this.dropDownGroupComponent}) : super(key: key);

  @override
  _DropDownGroupState createState() => _DropDownGroupState();
}

class _DropDownGroupState extends State<DropDownGroup> {
  String optionValue;
  dynamic dropDownGroupComponent;
  String itemGroupKey;

  @override
  void initState() {
    dropDownGroupComponent = widget.dropDownGroupComponent;
    itemGroupKey = dropDownGroupComponent['key'];

    super.initState();
  }

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
              setState(() {
                // optionValue = newValue;
                // debugPrint('value=' + newValue);
                // SurveySingleItemProvider surveySingleItemProvider =
                //     Provider.of<SurveySingleItemProvider>(context,
                //         listen: false);
                // dynamic response = Utils.constructSingleChoiceGroupItem(
                //     groupKey: itemGroupKey,
                //     key: newValue,
                //     responseItem: surveySingleItemProvider.responseItem);
                // surveySingleItemProvider.responseItem = response;
              });
            },
            items: choiceItemsWidget(dropDownGroupComponent['items']),
          )
        ]),
      ),
    );
  }
}
