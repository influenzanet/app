import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

class ThirdQuestionPage extends ScaffoldPage {
  final void Function() onAnswered;

  ThirdQuestionPage({@required this.onAnswered})
      : super(
            titleText: 'Weekly Influenza Survey',
            drawer: false,
            notificationButton: false,
            actions: <Widget>[ExitSurveyButton()]);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return ThirdQuestionForm(this.onAnswered);
  }
}

class ThirdQuestionForm extends StatefulWidget {
  final void Function() onAnswered;

  ThirdQuestionForm(this.onAnswered);

  @override
  ThirdQuestionFormState createState() => ThirdQuestionFormState();
}

class ThirdQuestionFormState extends State<ThirdQuestionForm> {
  static final _formKey = GlobalKey<FormState>();
  static final String _question = "How often do you sneeze a day?";

  double _value = 0.0;
  String _status = '';

  void setStatus(double newValue) {
    setState(() {
      _value = newValue;

      if (_value == 0) {
        _status = 'No Sneeze';
      } else if (_value < 25) {
        _status = 'Very Rare';
      } else if (_value > 25 && _value < 48) {
        _status = 'Rare';
      } else if (_value > 48 && _value < 53) {
        _status = 'Sometimes';
      } else if (_value > 53 && _value < 75) {
        _status = 'Quite Often';
      } else {
        _status = 'Often';
      }
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
            _progressBar(themeData),
            Spacer(flex: 5),
            _inputCheckBoxFields(themeData, _question),
            Spacer(flex: 10),
            _nextButton(themeData),
            Container(height: ThemeElements.pagePadding),
          ],
        ),
      ),
    );
  }

  Widget _progressBar(ThemeData themeData) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [70, 70, 70].map<Widget>((i) {
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
      text: 'Finish Survey',
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
          children: <Widget>[
            Text(
              question,
              style: themeData.textTheme.title,
              textAlign: TextAlign.left,
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: themeData.primaryColorLight,
                inactiveTrackColor: themeData.canvasColor,
                trackHeight: 5,
                thumbColor: themeData.primaryColor,
                thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 8,
                ),
              ),
              child: Slider(
                value: _value,
                min: 0,
                max: 100,
                onChanged: setStatus,
              ),
            ),
            Text(
              _status,
              style: themeData.textTheme.body2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
