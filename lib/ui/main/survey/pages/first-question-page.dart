import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:InfluenzaNet/ui/main/survey/models/flattened_rendered.dart';
import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/models/survey_single_item.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/body_component.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/question.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/widget_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstQuestionPage extends ListPage {
  final void Function() onAnswered;

  FirstQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  List<Widget> surveySingleItemBuilder(List flattendSurveyItems) {
    List<Widget> surveySingleItemList = [];
    flattendSurveyItems.forEach((item) {
      SurveySingleItemModel surveySingleItemModel =
          SurveySingleItemModel(surveySingleItem: item);
      surveySingleItemList.add(Padding(
          padding: const EdgeInsets.only(
            left: ThemeElements.pagePadding,
            top: ThemeElements.pagePadding,
            right: ThemeElements.pagePadding,
          ),
          child: ChangeNotifierProvider(
            create: (context) => SurveySingleItemProvider(),
            child: SurveySingleItemView(
                surveySingleItem: surveySingleItemModel.surveySingleItem),
          )));
    });
    return surveySingleItemList;
  }

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: surveySingleItemBuilder(qp),
      ),
    ];
  }

  @override
  Widget buildBottomWidget(BuildContext context, ThemeData themeData) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        Container(height: ThemeElements.elementPadding),
        ThemedPrimaryButton(
          themeData,
          primaryColor: true,
          text: 'Next',
          onPressed: () {
            onAnswered();
          },
        ),
      ],
    );
  }
}

class SurveySingleItemView extends StatefulWidget {
  final dynamic surveySingleItem;

  SurveySingleItemView({Key key, this.surveySingleItem}) : super(key: key);

  @override
  _SurveySingleItemViewState createState() => _SurveySingleItemViewState();
}

class _SurveySingleItemViewState extends State<SurveySingleItemView> {
  dynamic surveySingleItem;
  dynamic question;
  dynamic helpGroup;
  dynamic bodyComponent;
  @override
  void initState() {
    surveySingleItem = widget.surveySingleItem;
    question = Utils.getSingleItemComponentsByRole(
        surveySingleItem['components']['items'], 'title');
    helpGroup = Utils.getSingleItemComponentsByRole(
        surveySingleItem['components']['items'], 'helpGroup');
    bodyComponent = surveySingleItem['components']['items'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        child: Column(
          children: <Widget>[
            ThemedCard(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Question(questionComponent: question)),
                          IconButton(
                            icon: Icon(Icons.info_outline),
                            alignment: Alignment.topRight,
                            onPressed: () async {
                              _showHelpGroup(context);
                            },
                          ),
                        ]),
                    Container(
                      height: ThemeElements.cardContentPadding,
                    ),
                    Body(bodyComponent: bodyComponent),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showHelpGroup(context) async {
    List<Widget> helpWidgets =
        WidgetUtils.getHelpGroupContents(helpGroup, context);
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Help',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: helpWidgets,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
