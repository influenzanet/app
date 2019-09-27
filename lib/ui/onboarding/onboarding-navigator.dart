import 'package:InfluenzaNet/ui/onboarding/pages/instance-selection-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/login-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/register-page.dart';
import 'package:InfluenzaNet/ui/onboarding/pages/welcome-page.dart';
import 'package:flutter/material.dart';

class OnboardingNavigator extends StatelessWidget {
  static const String instanceSelectionRoute = 'onboarding/instanceSelection';
  static const String welcomeRoute = 'onboarding/welcome';
  static const String registerRoute = 'onboarding/register';
  static const String loginRoute = 'onboarding/login';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: instanceSelectionRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case instanceSelectionRoute:
            builder = _instanceSelectionPage;
            break;
          case welcomeRoute:
            builder = _welcomePage;
            break;
          case registerRoute:
            builder = _registerPage;
            break;
          case loginRoute:
            builder = _loginPage;
            break;
          default:
            print('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  InstanceSelectionPage _instanceSelectionPage(BuildContext context) => InstanceSelectionPage();
  WelcomePage _welcomePage(BuildContext context) => WelcomePage();
  RegisterPage _registerPage(BuildContext context) => RegisterPage();
  LoginPage _loginPage(BuildContext context) => LoginPage();
}
