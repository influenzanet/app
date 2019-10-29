import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/forms/themed-long-text-form-field.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/answer-wrap.dart';
import 'package:flutter/material.dart';

enum Answer { yes, no }

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
            child: FirstQuestionList(),
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
  FirstQuestionList({Key key}) : super(key: key);

  @override
  _FirstQuestionListState createState() => _FirstQuestionListState();
}

class _FirstQuestionListState extends State<FirstQuestionList> {
  static final _formKey = GlobalKey<FormState>();
  Answer _answer = Answer.yes;
  static final String firstQuestion = "Did you visit a doctor?";
  static final String secondQuestion = "Please describe your symptoms in more detail";

  void setAnswer(Answer answer) {
    setState(() {
      _answer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Form(
      key: _formKey,
      child: Container(
         child: Column(
           children: <Widget>[
             _inputRadioButtonFields(themeData, firstQuestion),
             Container(
               height: ThemeElements.cardContentPadding,
             ),
             _inputLongTextFields(themeData, secondQuestion),
             Container(
               height: ThemeElements.cardContentPadding,
             ),
             _inputLongTextFields(themeData, secondQuestion),
             Container(
               height: ThemeElements.cardContentPadding,
             ),
           ],
         ),
      ),
    );
  }

  Widget _inputRadioButtonFields(ThemeData themeData, String question) {
    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstQuestion,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            Container(
               height: ThemeElements.cardContentPadding,
            ),
            AnswerWrap(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: Answer.yes,
                      groupValue: _answer,
                      onChanged: (Answer value) {
                        setState(() {
                          _answer = value;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () => setAnswer(Answer.yes),
                      child: const Text('Yes'),
                    )
                  ],
                ),                  
                Row(
                  children: <Widget>[
                    Radio(
                      value: Answer.no,
                      groupValue: _answer,
                      onChanged: (Answer value) {
                        setState(() {
                          _answer = value;
                      });                        },
                    ),
                    InkWell(
                      onTap: () => setAnswer(Answer.no),
                      child: const Text('No'),
                    )
                  ],
                ),
              ],
            ),
            /*Container(
               height: ThemeElements.cardContentPadding,
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _inputLongTextFields(ThemeData themeData, String question) {
    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              secondQuestion,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            Container(
               height: ThemeElements.cardContentPadding,
             ),
            ThemedLongTextFormField(
                hintText: "Fill in Here",
                maxlines: 5,
            ),
            /*Container(
               height: ThemeElements.cardContentPadding,
            ),*/
          ],
        ),
      ),
    );
  }
}