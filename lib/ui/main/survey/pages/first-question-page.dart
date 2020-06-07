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

  FirstQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    SurveySingleItemModel surveySingleItemModel =
        SurveySingleItemModel(surveySingleItem: qp[0]);
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
                surveySingleItem: surveySingleItemModel.surveySingleItem),
          ),
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
          onPressed: onAnswered,
        ),
      ],
    );
  }
}

class FirstQuestionList extends StatefulWidget {
  final dynamic surveySingleItem;

  FirstQuestionList({Key key, this.surveySingleItem}) : super(key: key);

  @override
  _FirstQuestionListState createState() => _FirstQuestionListState();
}

class _FirstQuestionListState extends State<FirstQuestionList> {
  //static final String firstQuestion = "Did you visit a doctor?";

  dynamic surveySingleItem;
  dynamic question;
  dynamic helpGroup;
  dynamic bodyComponent;
  final _formKey = GlobalKey<FormState>();
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
      key: _formKey,
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

//   Widget _inputRadioButtonFields(ThemeData themeData, String question) {
//     return ThemedCard(
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               firstQuestion,
//               style: themeData.textTheme.headline6,
//               textAlign: TextAlign.left,
//             ),
//             Container(
//               height: ThemeElements.cardContentPadding,
//             ),
//             AnswerWrap(children: <Widget>[
//               Column(children: <Widget>[ThemedRadioFormField()])
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TimeValue {
//   final int _key;
//   final String _value;
//   TimeValue(this._key, this._value);
// }

// class ThemedRadioFormField extends StatefulWidget {
//   ThemedRadioFormField({Key key}) : super(key: key);

//   @override
//   _ThemedRadioFormFieldState createState() => _ThemedRadioFormFieldState();
// }

// class _ThemedRadioFormFieldState extends State<ThemedRadioFormField> {
//   int _currentTimeValue = 1;

//   final _buttonOptions = [
//     TimeValue(30, "30 minutes"),
//     TimeValue(60, "1 hour"),
//     TimeValue(120, "2 hours"),
//     TimeValue(240, "4 hours"),
//     TimeValue(480, "8 hours"),
//     TimeValue(720, "12 hours"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Wrap(
//           crossAxisAlignment: WrapCrossAlignment.center,
//           children: <Widget>[
//             SizedBox(
//               height: 400.0,
//               child: ListView(
//                 shrinkWrap: true,
//                 children: _buttonOptions
//                     .map((timeValue) => RadioListTile(
//                           dense: false,
//                           groupValue: _currentTimeValue,
//                           title:
//                               Text(timeValue._value, textAlign: TextAlign.left),
//                           value: timeValue._key,
//                           onChanged: (val) {
//                             setState(() {
//                               debugPrint('VAL = $val');
//                               _currentTimeValue = val;
//                             });
//                           },
//                         ))
//                     .toList(),
//               ),
//             )
//           ],
//         ),
//       ],
//     );
//   }
//
}
