import 'package:InfluenzaNet/ui/main/survey/utils/utils.dart';
import 'package:flutter/material.dart';

class TextViewComponent extends StatelessWidget {
  final dynamic textComponent;
  final bool disabled;
  const TextViewComponent({Key key, this.textComponent, this.disabled})
      : super(key: key);

  Widget _classifyStyles(BuildContext context, dynamic textComponent) {
    List styles = textComponent['style'];
    String content = Utils.getContent(textComponent);
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;
    if (disabled == true) {
      textTheme = themeData.textTheme.apply(
          displayColor: themeData.disabledColor,
          bodyColor: themeData.disabledColor);
    }
    if (styles == null) {
      return Text(content,
          textAlign: TextAlign.left, style: textTheme.bodyText2);
    }
    int variantPosition =
        styles.indexWhere((style) => style['key'] == 'variant');
    String variant = ((variantPosition == -1)
        ? 'bodyText2'
        : styles[variantPosition]['value']);

    switch (variant) {
      case 'bodyText1':
      case 'body2':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.bodyText1);
      case 'bodyText2':
      case 'body1':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.bodyText2);
      case 'headline1':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline1);
      case 'headline2':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline2);
      case 'headline3':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline3);
      case 'headline4':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline4);
      case 'headline5':
      case 'headline':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline5);
      case 'headline6':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.headline6);
      case 'subtitle1':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.subtitle1);
      case 'subtitle2':
      case 'subtitle':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.subtitle2);
      case 'button':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.button);
      case 'caption':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.caption);
      case 'overline':
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.overline);
      default:
        return Text(content,
            textAlign: TextAlign.left, style: textTheme.bodyText2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _classifyStyles(context, this.textComponent);
  }
}
