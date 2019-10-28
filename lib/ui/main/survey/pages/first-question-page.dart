import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:flutter/material.dart';

enum Answer { yes, no }

class FirstQuestionPage extends ScaffoldPage {
  final void Function() onAnswered;

  FirstQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return FirstQuestionForm(this.onAnswered);
  }
}

class FirstQuestionForm extends StatefulWidget {
  final void Function() onAnswered;

  FirstQuestionForm(this.onAnswered);

  @override
  FirstQuestionFormState createState() => FirstQuestionFormState();
}

class FirstQuestionFormState extends State<FirstQuestionForm> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeElements.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(flex: 5),
            _inputRadioButtonFields(themeData, firstQuestion),
            Spacer(flex: 1),
            _inputLongTextFields(themeData, secondQuestion),
            Spacer(flex: 10),
            _nextButton(themeData),
            Container(height: ThemeElements.pagePadding),
          ],
        ),
      ),
    );
  }

  Widget _nextButton(ThemeData themeData) {
    return ThemedPrimaryButton(
      themeData,
      primaryColor: true,
      text: 'Next',
      onPressed: () {
        widget.onAnswered();
      },
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
              question,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            Column(
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
                        });
                      },
                    ),
                    InkWell(
                      onTap: () => setAnswer(Answer.no),
                      child: const Text('No'),
                    )
                  ],
                ),
              ],
            ),
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
              question,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: new TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5, // Or use "null" to make it grow automatically
                decoration: new InputDecoration.collapsed(
                  hintText: 'Fill in here',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
