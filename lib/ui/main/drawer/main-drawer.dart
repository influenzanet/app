import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    EdgeInsets screenPadding = MediaQuery.of(context).padding;
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: screenPadding.top,
            color: Colors.white,
          ),
          Container(
            color: Colors.white,
            height: kToolbarHeight,
            padding: EdgeInsets.all(10.0),
            child: Image.asset('assets/images/logos/influenzanet.png'),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeElements.elementPadding, vertical: ThemeElements.elementPadding / 2),
              children: <Widget>[
                _drawerItem(context, 'Home', route: MainNavigator.homeRoute),
                _drawerItem(context, 'Explore', route: MainNavigator.exploreStudiesRoute),
                _drawerItem(context, 'My Studies', route: MainNavigator.myStudiesRoute),
                Divider(),
                _drawerItem(context, 'Coverage Map', color: themeData.primaryColor),
                _drawerItem(context, 'Devices', color: themeData.primaryColor),
                _drawerItem(context, 'News', color: themeData.primaryColor, route: MainNavigator.newsRoute),
                Divider(),
                _drawerItem(context, 'Profile', color: themeData.accentColor, route: MainNavigator.profileRoute),
                _drawerItem(context, 'History', color: themeData.accentColor),
                _drawerItem(context, 'Settings', color: themeData.accentColor),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: ThemeElements.elementPadding / 2, bottom: ThemeElements.elementPadding),
                child: ThemedSecondaryButton.big(
                  themeData,
                  text: 'Logout',
                  onPressed: () {
                    MainNavigator.pushOnboardingRoute();
                  },
                ),
              ),
            ],
          ),
          Container(height: screenPadding.bottom),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, {Color color = Colors.black, String route}) {
    bool enabled = route != null;

    if (!enabled) {
      color = Theme.of(context).disabledColor;
    }

    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.title.apply(color: color),
        textAlign: TextAlign.start,
      ),
      enabled: enabled,
      dense: true,
      onTap: (enabled)
          ? () {
              MainNavigator.navigatorKey.currentState.pushReplacementNamed(route);
            }
          : null,
    );
  }
}
