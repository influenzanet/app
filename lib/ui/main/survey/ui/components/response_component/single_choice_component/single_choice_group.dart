import 'package:InfluenzaNet/ui/main/survey/models/input_choice_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/models/qpattern4.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_page_view_provider.dart';
import 'package:InfluenzaNet/ui/main/survey/survey-navigator.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleChoiceGroup extends StatefulWidget {
  final dynamic singleChoiceGroupComponent;
  SingleChoiceGroup({Key key, this.singleChoiceGroupComponent})
      : super(key: key);

  @override
  _SingleChoiceGroupState createState() => _SingleChoiceGroupState();
}

class _SingleChoiceGroupState extends State<SingleChoiceGroup> {
  dynamic singleChoiceGroupComponent;
  String itemGroupKey;

  @override
  void initState() {
    singleChoiceGroupComponent = widget.singleChoiceGroupComponent;
    itemGroupKey = singleChoiceGroupComponent['key'];
    super.initState();
  }

  List<Widget> choiceItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = Consumer<InputChoiceProvider>(
          builder: (context, choice, child) => RadioListTile(
                groupValue: choice.inputKey,
                title: WidgetUtils.classifySingleChoiceGroupComponent(
                    choiceComponent: item,
                    groupKey: itemGroupKey,
                    itemKey: item['key'],
                    content: Utils.getContent(item)),
                value: item['key'],
                onChanged: (val) {
                  setState(() {
                    Provider.of<SurveyPageViewProvider>(context, listen: false)
                        .surveyPageList = q4;
                    SurveyNavigator.navigatorKey.currentState
                        .popAndPushNamed(SurveyNavigator.firstQuestionRoute);
                    // SurveyNavigator.navigatorKey.currentState
                    //     .pushReplacementNamed(
                    //         SurveyNavigator.firstQuestionRoute);
                    // debugPrint('Selected value = $val');
                    // choice.inputKey = val;
                    // SurveySingleItemProvider surveySingleItemProvider =
                    //     Provider.of<SurveySingleItemProvider>(context,
                    //         listen: false);

                    // dynamic response = Utils.constructSingleChoiceGroupItem(
                    //     groupKey: itemGroupKey,
                    //     key: val,
                    //     responseItem: surveySingleItemProvider.responseItem);
                    // surveySingleItemProvider.responseItem = response;
                  });
                },
              ));

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
