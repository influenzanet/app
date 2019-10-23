import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:flutter/material.dart';

class ThemedCard extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color splashColor;
  final void Function() onTap;
  final Widget child;

  ThemedCard({this.width, this.height, @required this.color, this.splashColor, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(ThemeElements.cardBorderRadius)),
      width: width,
      height: height,
      child: InkWell(
        borderRadius: BorderRadius.circular(ThemeElements.cardBorderRadius),
        splashColor: splashColor?.withOpacity(0.75),
        highlightColor: splashColor?.withOpacity(0.5),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
