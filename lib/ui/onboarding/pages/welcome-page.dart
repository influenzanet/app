import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/onboarding/onboarding-navigator.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(themeData, titleText: 'Get Started'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeElements.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(flex: 17),
            _welcomeText(themeData),
            _logo(),
            Spacer(flex: 20),
            _loginButton(themeData, context),
            _signupButton(themeData, context),
          ],
        ),
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
      padding: const EdgeInsets.only(top: ThemeElements.connectedElementPadding),
      child: Image.asset('assets/images/logos/influenzanet.png'),
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
