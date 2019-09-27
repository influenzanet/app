import 'package:InfluenzaNet/ui/common/influenzanet_theme.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:InfluenzaNet/ui/onboarding/onboarding-navigator.dart';
import 'package:flutter/material.dart';

void main() => runApp(InfluenzaNet());

class InfluenzaNet extends StatelessWidget {
  static const String onboardingRoute = 'onboarding';
  static const String mainRoute = 'main';

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // Default to onboarding route until logic to check for existing login is implemented.
    // TODO: Set initial route depending on existing login
    return MaterialApp(
        title: 'InfluenzaNet',
        theme: influenzaNetTheme,
        initialRoute: onboardingRoute,
        routes: {onboardingRoute: _onboardingNavigator, mainRoute: _mainNavigator});
  }

  // Routes
  OnboardingNavigator _onboardingNavigator(BuildContext _) => OnboardingNavigator();
  MainNavigator _mainNavigator(BuildContext _) => MainNavigator();
}
