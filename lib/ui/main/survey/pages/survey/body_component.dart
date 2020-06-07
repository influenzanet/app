import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final dynamic bodyComponent;
  Body({Key key, this.bodyComponent}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  dynamic bodyComponent;
  @override
  void initState() {
    bodyComponent = widget.bodyComponent;
    super.initState();
  }

  List<Widget> bodyItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = WidgetUtils.classifyRootComponent(item);
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
          children: bodyItemsWidget(bodyComponent),
        ),
      ),
    );
  }
}
