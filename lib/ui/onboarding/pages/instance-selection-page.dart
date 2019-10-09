import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-flat-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-raised-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/onboarding/onboarding-navigator.dart';
import 'package:flutter/material.dart';

class InstanceSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(flex: 15),
          _title(themeData),
          Spacer(flex: 15),
          _countrySelection(themeData),
          Spacer(flex: 20),
          _nextButton(context, themeData),
        ],
      ),
    );
  }

  Widget _title(ThemeData themeData) {
    return Text(
      'Select your Country',
      style: themeData.textTheme.display1.copyWith(color: themeData.primaryColor),
      textAlign: TextAlign.center,
    );
  }

  Widget _countrySelection(ThemeData themeData) {
    return Column(
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
              height: 175,
              child: Image.asset('assets/images/country-flags/germany.png'),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ThemedFlatButton(
              themeData,
              text: 'Change Country',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _nextButton(
    BuildContext context,
    ThemeData themeData,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ThemedRaisedButton(
          themeData,
          text: 'Next',
          onPressed: () {
            Navigator.of(context).pushNamed(OnboardingNavigator.welcomeRoute);
          },
        ),
      ],
    );
  }
}
