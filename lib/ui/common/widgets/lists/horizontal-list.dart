import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/headers/section-header.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SectionHeader(
          titleText: titleText,
          horizontalPadding: horizontalPadding,
          onViewAllPressed: onViewAllPressed,
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
