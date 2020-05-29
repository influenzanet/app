import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends ScaffoldPage {
  ProfilePage() : super(titleText: 'Profile');

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return Center(
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
      style: themeData.textTheme.headline6,
    );
  }

  Widget _password(ThemeData themeData) {
    return Text(
      '•••••••••••••••••••••',
      style: themeData.textTheme.headline6,
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
