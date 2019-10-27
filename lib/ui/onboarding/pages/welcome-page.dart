import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:InfluenzaNet/ui/onboarding/onboarding-navigator.dart';
import 'package:flutter/material.dart';

class WelcomePage extends ScaffoldPage {
  WelcomePage() : super(titleText: 'Get Started', drawer: false, notificationButton: false);

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeElements.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(flex: 17),
          _welcomeText(themeData),
          Container(height: ThemeElements.connectedElementPadding),
          _logo(),
          Spacer(flex: 20),
          _loginButton(themeData, context),
          _signupButton(themeData, context),
          Container(height: ThemeElements.pagePadding),
        ],
      ),
    );
  }

  Widget _welcomeText(ThemeData themeData) {
    return Text(
      'Welcome to',
      textAlign: TextAlign.center,
      style: themeData.textTheme.display1,
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ThemeElements.pagePadding),
      child: Image.asset(
        'assets/images/logos/influenzanet.png',
      ),
    );
  }

  Widget _loginButton(ThemeData themeData, BuildContext context) {
    return ThemedPrimaryButton(
      themeData,
      text: 'Login',
      onPressed: () {
        Navigator.of(context).pushNamed(OnboardingNavigator.loginRoute);
      },
    );
  }

  Widget _signupButton(ThemeData themeData, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: ThemeElements.elementPadding),
      child: ThemedPrimaryButton(
        themeData,
        primaryColor: false,
        text: 'Create New Account',
        onPressed: () {
          Navigator.of(context).pushNamed(OnboardingNavigator.registerRoute);
        },
      ),
    );
  }
}
