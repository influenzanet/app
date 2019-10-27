import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String text;
  final String url;
  final double width;
  final double height;

  NewsItem({
    @required this.title,
    @required this.subtitle,
    @required this.text,
    @required this.url,
    @required this.width,
    @required this.height,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ThemedCard(
      width: width,
      height: height,
      onTap: () {
        _openUrl(url);
      },
      child: Padding(
        padding: EdgeInsets.all(ThemeElements.cardContentPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _title(themeData),
            _subtitle(themeData),
            Container(height: ThemeElements.connectedElementPadding),
            _text(themeData),
          ],
        ),
      ),
    );
  }

  Widget _title(ThemeData themeData) {
    return Text(
      title,
      style: themeData.textTheme.headline,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget _subtitle(ThemeData themeData) {
    return Text(
      subtitle,
      style: themeData.textTheme.subhead,
    );
  }

  Widget _text(ThemeData themeData) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          TextStyle textStyle = themeData.textTheme.body1.copyWith(height: 1.1);
          int maxLines =
              (constraints.maxHeight / textStyle.height / textStyle.fontSize / MediaQuery.textScaleFactorOf(context))
                  .floor();
          return Text(
            text,
            style: textStyle,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          );
        },
      ),
    );
  }

  _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
