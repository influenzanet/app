import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/main/survey/models/response.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/body_component.dart';
import 'package:InfluenzaNet/ui/main/survey/pages/survey/question.dart';
import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveySingleItemWidget extends StatefulWidget {
  SurveySingleItemWidget({Key key, this.title, this.surveySingleItem})
      : super(key: key);

  final String title;
  final dynamic surveySingleItem;

  @override
  _SurveySingleItemWidgetState createState() => _SurveySingleItemWidgetState();
}

class _SurveySingleItemWidgetState extends State<SurveySingleItemWidget> {
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

  Future<void> _showHelpGroup(
    context, {
    dynamic helpGroup,
  }) async {
    dynamic textList =
        Utils.getListItemComponentsByRole(helpGroup['items'], 'text');

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Help',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: helpItemsWidget(textList),
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

  List<Widget> helpItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      String helpText = Utils.getContent(item);
      result.add(Text(helpText));
      result.add(Text(''));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemedAppBar(
        Theme.of(context),
        titleText: widget.title,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              _showHelpGroup(context, helpGroup: helpGroup);
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Question(questionComponent: question),
                  ),
                  ChangeNotifierProvider(
                      create: (context) => SurveySingleItemProvider(),
                      child: Body(bodyComponent: bodyComponent)),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Builder(
                      builder: (context) => ThemedPrimaryButton(
                        Theme.of(context),
                        primaryColor: true,
                        text: 'Next',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Fetching next Survey Item')));
                            _formKey.currentState.save();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
