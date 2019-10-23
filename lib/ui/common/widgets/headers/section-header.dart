import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String titleText;
  final double horizontalPadding;
  final void Function() onViewAllPressed;

  SectionHeader({
    @required this.titleText,
    this.horizontalPadding = ThemeElements.pagePadding,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            titleText,
            style: themeData.textTheme.display1,
          ),
          Visibility(
            visible: onViewAllPressed != null,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: ThemedSecondaryButton(
              themeData,
              text: (onViewAllPressed != null) ? 'View All' : '',
              onPressed: onViewAllPressed,
            ),
          ),
        ],
      ),
    );
  }
}
