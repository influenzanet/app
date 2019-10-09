import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-raised-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(themeData, titleText: 'Get Started'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(flex: 17),
            _welcomeText(themeData),
            _logo(),
            Spacer(flex: 20),
            _loginButton(themeData),
            _signupButton(themeData),
          ],
        ),
      ),
    );
  }

  Widget _welcomeText(ThemeData themeData) {
    return Text(
      'Welcome to',
      textAlign: TextAlign.center,
      style: themeData.textTheme.display1.copyWith(color: Colors.black),
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Image.asset("assets/images/logos/influenzanet.png"),
    );
  }

  Widget _loginButton(ThemeData themeData) {
    return ThemedRaisedButton(
      themeData,
      text: 'Login',
      onPressed: () {},
    );
  }

  Widget _signupButton(ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: ThemedRaisedButton(
        themeData,
        primaryColor: false,
        text: 'Create New Account',
        onPressed: () {},
      ),
    );
  }
}
