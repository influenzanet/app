import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/survey/exit-survey-button.dart';
import 'package:InfluenzaNet/ui/main/survey/widgets/survey_item_view/answer-wrap.dart';
import 'package:flutter/material.dart';

class ThirdQuestionPage extends ListPage {
  final void Function() onAnswered;

  ThirdQuestionPage({@required this.onAnswered})
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
            child: ThirdQuestionList(),
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
          text: 'Finish Survey',
          onPressed: onAnswered,
        ),
      ],
    );
  }
}

class ThirdQuestionList extends StatefulWidget {
  ThirdQuestionList({Key key}) : super(key: key);

  @override
  _ThirdQuestionListState createState() => _ThirdQuestionListState();
}

class _ThirdQuestionListState extends State<ThirdQuestionList> {
  static final _formKey = GlobalKey<FormState>();
  static final String _question = "How often do you sneeze in a day?";

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
      child: Container(
        child: Column(
          children: <Widget>[
            _inputSlider(themeData, _question),
          ],
        ),
      ),
    );
  }

  Widget _inputSlider(ThemeData themeData, String question) {
    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            Text(
              question,
              style: themeData.textTheme.headline6,
              textAlign: TextAlign.left,
            ),
            Container(
              height: ThemeElements.cardContentPadding,
            ),
            AnswerWrap(
              children: <Widget>[
                SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: themeData.accentColor,
                    inactiveTrackColor: Colors.white,
                    trackHeight: 5,
                    thumbColor: themeData.accentColor,
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    _status,
                    style: themeData.textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
