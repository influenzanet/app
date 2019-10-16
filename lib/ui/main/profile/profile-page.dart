import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(
        themeData,
        titleText: 'Profile',
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _avatar(),
            Container(height: ThemeElements.elementPadding),
            _username(themeData),
            Container(height: ThemeElements.elementPadding),
            _password(themeData),
            Container(height: ThemeElements.elementPadding),
            _editButton(themeData),
          ],
        ),
      ),
    );
  }

  Widget _avatar() {
    return Container(
      height: 170,
      child: Image.asset('assets/images/avatars/default-avatar.png'),
    );
  }

  Widget _username(ThemeData themeData) {
    return Text(
      'max.mustermann@muster.de',
      style: themeData.textTheme.title,
    );
  }

  Widget _password(ThemeData themeData) {
    return Text(
      '•••••••••••••••••••••',
      style: themeData.textTheme.title,
    );
  }

  Widget _editButton(ThemeData themeData) {
    return ThemedSecondaryButton(
      themeData,
      text: 'Edit Profile',
      onPressed: () {},
    );
  }
}
