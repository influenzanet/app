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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstQuestionPage extends ListPage {
  final void Function() onAnswered;
  final _formKey = GlobalKey<FormState>();

  FirstQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    SurveySingleItemModel surveySingleItemModel =
        SurveySingleItemModel(surveySingleItem: qp[2]);
    return <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(
                left: ThemeElements.pagePadding,
                top: ThemeElements.pagePadding,
                right: ThemeElements.pagePadding,
              ),
              child: FirstQuestionList(
                  surveySingleItem: surveySingleItemModel.surveySingleItem,
                  formKey: _formKey)),
        ],
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
            if (_formKey.currentState.validate()) {
              debugPrint('Validating');
            }
            onAnswered();
          },
        ),
      ],
    );
  }
}

class FirstQuestionList extends StatefulWidget {
  final dynamic surveySingleItem;
  final dynamic formKey;

  FirstQuestionList({Key key, this.surveySingleItem, this.formKey})
      : super(key: key);

  @override
  _FirstQuestionListState createState() => _FirstQuestionListState();
}

class _FirstQuestionListState extends State<FirstQuestionList> {
  //static final String firstQuestion = "Did you visit a doctor?";

  dynamic surveySingleItem;
  dynamic question;
  dynamic helpGroup;
  dynamic bodyComponent;
  dynamic formKey;
  @override
  void initState() {
    surveySingleItem = widget.surveySingleItem;
    formKey = widget.formKey;
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
      key: formKey,
      child: Container(
        child: Column(
          children: <Widget>[
            ThemedCard(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Question(questionComponent: question),
                    Container(
                      height: ThemeElements.cardContentPadding,
                    ),
                    ChangeNotifierProvider(
                        create: (context) => ResponseModel(),
                        child: Body(bodyComponent: bodyComponent)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
