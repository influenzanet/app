import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

class SecondQuestionPage extends ScaffoldPage {
  final void Function() onAnswered;

  SecondQuestionPage({@required this.onAnswered}) : super(titleText: 'Weekly Influenza Survey', drawer: false, notificationButton: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return SecondQuestionForm(this.onAnswered);
  }

}

class SecondQuestionForm extends StatefulWidget {
  final void Function() onAnswered;

  SecondQuestionForm(this.onAnswered);

  @override
  SecondQuestionFormState createState() => SecondQuestionFormState();
}

class SecondQuestionFormState extends State<SecondQuestionForm> {
  static final _formKey = GlobalKey<FormState>();
  static final String _question = "Do you feel one or more symptoms below?";

  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _checkbox5 = false;

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
            _progressBar(themeData),
            Spacer(flex: 5),
            _inputCheckBoxFields(themeData, _question),
            Spacer(flex: 10),
            _nextButton(themeData),
          ],
        ),
      ),
    );
  }

  Widget _progressBar(ThemeData themeData) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [70, 70, 0].map<Widget>((i) {
         return Padding(
             padding: EdgeInsets.only(right: 10),
             child: IntervalProgressBar(
                 direction: IntervalProgressDirection.horizontal,
                 max: 70,
                 progress: i,
                 intervalSize: 2,
                 size: Size(70, 5),
                 highlightColor: themeData.accentColor,
                 defaultColor: themeData.disabledColor,
                 intervalColor: Colors.transparent,
                 intervalHighlightColor: Colors.transparent,
                 reverse: true,
                 radius: 0));
       }).toList());
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

  Widget _inputCheckBoxFields(ThemeData themeData, String question) {
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
            LabeledCheckbox(
              label: 'This is the first label text',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _checkbox1,
              onChanged: (bool newValue) {
                setState(() {
                  _checkbox1 = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'This is the second label text',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _checkbox2,
              onChanged: (bool newValue) {
                setState(() {
                  _checkbox2 = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'This is the third label text',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _checkbox3,
              onChanged: (bool newValue) {
                setState(() {
                  _checkbox3 = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'This is the fourth label text',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _checkbox4,
              onChanged: (bool newValue) {
                setState(() {
                  _checkbox4 = newValue;
                });
              },
            ),
            LabeledCheckbox(
              label: 'This is the fifth label text',
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: _checkbox5,
              onChanged: (bool newValue) {
                setState(() {
                  _checkbox5 = newValue;
                });
              },
            )
          ],
        ),
      ),
    );
  }

}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}