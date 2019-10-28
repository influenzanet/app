import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String titleText;
  final double horizontalPadding;
  // Make View All Button only invisible but still use it for layout. Since button is higher than default text, this is important for proper layout.
  final bool viewAllButtonLayout;
  final void Function() onViewAllPressed;
  final TextStyle titleTextStyle;

  SectionHeader({
    @required this.titleText,
    this.horizontalPadding = ThemeElements.pagePadding,
    this.onViewAllPressed,
    this.titleTextStyle,
    this.viewAllButtonLayout = true,
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
            style: (titleTextStyle == null) ? themeData.textTheme.display1 : titleTextStyle,
          ),
          if (viewAllButtonLayout)
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
