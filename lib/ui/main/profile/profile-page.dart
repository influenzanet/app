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
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.edit),
        //     onPressed: () {},
        //   )
        // ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _avatar(themeData),
            Container(height: ThemeElements.elementPadding),
            Text(
              'max.mustermann@muster.de',
              style: themeData.textTheme.title,
            ),
            Container(height: ThemeElements.elementPadding),
            Text(
              '•••••••••••••••••••••',
              style: themeData.textTheme.title,
            ),
            Container(height: ThemeElements.elementPadding),
            ThemedSecondaryButton(themeData, text: 'Edit Profile'),
          ],
        ),
      ),
    );
  }

  Widget _avatar(ThemeData themeData) {
    return Container(
      height: 170,
      child: Image.asset('assets/images/avatars/default-avatar.png'),
    );
  }
}
