import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResponseComponent extends StatefulWidget {
  final dynamic responseComponent;
  ResponseComponent({Key key, this.responseComponent}) : super(key: key);

  @override
  _ResponseComponentState createState() => _ResponseComponentState();
}

class _ResponseComponentState extends State<ResponseComponent> {
  dynamic responseComponent;
  @override
  void initState() {
    responseComponent = widget.responseComponent;
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => initialiseResponseRoot(context));
  }

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
    dynamic result = {'key': responseComponent['key'], 'items': responseList};
    Provider.of<ResponseModel>(context, listen: false).initResponseItem(result);
  }

  List<Widget> responseItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = WidgetUtils.classifyResponseComponent(item);
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
