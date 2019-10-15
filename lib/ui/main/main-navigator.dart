import 'package:InfluenzaNet/ui/common/widgets/navigators/navigator-page.dart';
import 'package:InfluenzaNet/ui/main/home/home-page.dart';
import 'package:InfluenzaNet/ui/main/my-studies/my-studies-page.dart';
import 'package:InfluenzaNet/ui/main/profile/profile-page.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatelessWidget {
  static const String homeRoute = 'main/home';
  static const String myStudiesRoute = 'main/myStudies';
  static const String profileRoute = 'main/profile';

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NavigatorPage(
      navigatorKey: navigatorKey,
      initialRoute: homeRoute,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case homeRoute:
            builder = _homePage;
            break;
          case myStudiesRoute:
            builder = _myStudiesPage;
            break;
          case profileRoute:
            builder = _profilePage;
            break;
          default:
            print('Invalid route: ${settings.name}');
        }

        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }

  HomePage _homePage(BuildContext context) => HomePage();
  MyStudiesPage _myStudiesPage(BuildContext context) => MyStudiesPage();
  ProfilePage _profilePage(BuildContext context) => ProfilePage();
}
