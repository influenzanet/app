import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class ResponseComponent extends StatelessWidget {
  final dynamic responseComponent;
  final String surveyKey;
  const ResponseComponent({
    Key key,
    this.responseComponent,
    this.surveyKey,
  }) : super(key: key);

  void initialiseResponseRoot(BuildContext context) {
    List responseList = [];
    List itemList = responseComponent['items'];
    itemList.forEach((item) {
      switch (item['role']) {
        case 'singleChoiceGroup':
        case 'multipleChoiceGroup':
        case 'dropDownGroup':
          responseList.add({'key': item['key'], 'items': []});
      }
    });
  }

  List<Widget> responseItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget =
          WidgetUtils.classifyResponseComponent(item, surveyKey);
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
        children: responseItemsWidget(responseComponent['items']),
      )),
    );
  }
}
