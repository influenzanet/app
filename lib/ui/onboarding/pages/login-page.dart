import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(
        themeData,
        titleText: 'Login',
      ),
    );
  }
}
