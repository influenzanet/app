import 'package:InfluenzaNet/ui/common/influenzanet_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Welcome to InfluenzaNet",
          textAlign: TextAlign.center,
          style: TextStyle(color: themeData.primaryColor),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(
            flex: 15,
          ),
          Text(
            'Select your Country',
            style: themeData.textTheme.display1.apply(color: themeData.accentColor),
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 15),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Germany',
                textAlign: TextAlign.center,
                style: themeData.textTheme.title,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  shape: CircleBorder(),
                  color: Colors.grey,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {},
                  child: Container(
                    color: Colors.red,
                    height: 175,
                    child: Image.asset("assets/images/country-flags/germany.png"),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Change Country',
                    ),
                    color: Colors.white,
                    textColor: themeData.accentColor,
                    splashColor: ThemeElements.accentSwatch[50],
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          Spacer(flex: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: themeData.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 30.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(flex: 10)
        ],
      ),
    );
  }
}
