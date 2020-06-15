import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';

// class Body extends StatefulWidget {
//   final dynamic bodyComponent;
//   final String surveyKey;
//   Body({Key key, this.bodyComponent, this.surveyKey}) : super(key: key);

//   @override
//   _BodyState createState() => _BodyState();
// }

class Body extends StatelessWidget {
  final dynamic bodyComponent;
  final String surveyKey;
  Body({
    Key key,
    this.bodyComponent,
    this.surveyKey,
  }) : super(key: key);

  List<Widget> bodyItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = WidgetUtils.classifyRootComponent(item, surveyKey);
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
