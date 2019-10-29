import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/answer-wrap.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';

class SecondQuestionPage extends ListPage {
  final void Function() onAnswered;

  SecondQuestionPage({@required this.onAnswered})
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
            child: SecondQuestionList(),
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

class CheckBoxData {
    String label;
    bool value;

    CheckBoxData(this.label, this.value);
}

class SecondQuestionList extends StatefulWidget {
  SecondQuestionList({Key key}) : super(key: key);

  @override
  _SecondQuestionListState createState() => _SecondQuestionListState();
}

class _SecondQuestionListState extends State<SecondQuestionList> {
  static final _formKey = GlobalKey<FormState>();
  static final String _question = 'Do you feel one or more symptoms below?';

  List<CheckBoxData> checkBoxData = [
    CheckBoxData('This is the first label', false), 
    CheckBoxData('This is the second label', false),
    CheckBoxData('This is the third label', false),
    CheckBoxData('This is the fourth label', false),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Form(
      key: _formKey,
      child: Container(
         child: Column(
           children: <Widget>[
             _inputCheckBoxFields(themeData, _question),
           ],
         ),
      ),
    );
  }

  Widget _inputCheckBoxFields(ThemeData themeData, String question) {
    List checkBoxItems = checkBoxData.map((data) => _checkBoxField(
      themeData, 
      data.label, 
      data.value, 
      (value) => setState(() {
        data.value = value;
        }) 
    )).toList();

    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            Container(
              height: ThemeElements.cardContentPadding,
            ),
            AnswerWrap(
              children: checkBoxItems,
            ),
            /*Container(
               height: ThemeElements.cardContentPadding,
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _checkBoxField(ThemeData themeData, String label, bool value, dynamic Function(bool value) onPressed) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              label,
              style: themeData.textTheme.body1,
              maxLines: 2,
            ),
          ),
        ),
        Expanded(
          child: CircularCheckBox(
            onChanged: onPressed,
            value: value,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
