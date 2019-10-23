import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final String titleText;
  final double height;
  final double itemPadding;
  final double horizontalPadding;
  final void Function() onViewAllPressed;
  final List<Widget> children;

  HorizontalList({
    @required this.titleText,
    @required this.height,
    @required this.children,
    this.itemPadding = ThemeElements.listItemPadding,
    this.horizontalPadding = ThemeElements.pagePadding,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
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
        ),
        Container(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: horizontalPadding - itemPadding),
              ...children,
              Container(width: horizontalPadding - itemPadding),
            ],
          ),
        ),
      ],
    );
  }
}
