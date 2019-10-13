import 'package:InfluenzaNet/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:InfluenzaNet/ui/common/widgets/scaffolds/themed-scaffold.dart';
import 'package:InfluenzaNet/ui/main/drawer/main-drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedScaffold(
      appBar: ThemedAppBar(
        themeData,
        titleText: 'Home',
      ),
      drawer: MainDrawer(),
    );
  }
}
