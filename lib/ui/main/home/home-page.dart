import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends ScaffoldPage {
  HomePage() : super(titleText: 'Home');

  @override
  Widget buildBody(BuildContext context, ThemeData themeData) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              left: ThemeElements.pagePadding, top: ThemeElements.pagePadding, right: ThemeElements.pagePadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'News',
                style: themeData.textTheme.display1,
              ),
              ThemedSecondaryButton(
                themeData,
                text: 'View All',
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(width: ThemeElements.pagePadding - (ThemeElements.connectedElementPadding / 2)),
              _newsItem(
                context,
                themeData,
                'Automated Testing',
                'May 21, 2019',
                'When it comes to delivering a product to customers, every company would make sure that the outcome meets certain quality criteria before handing it over. This is because as human beings we are prone to make mistakes, and no matter how hard we try to keep every aspect and little detail in mind, we might still end up missing a key point or make a small mistake that is going to cost us a lot in later phases.',
                'https://influenzanet.github.io/news/2019-05-21-automatic-testing/',
              ),
              _newsItem(
                context,
                themeData,
                'Token-based Authentication',
                'May 17, 2019',
                'InfluenzaNet is becoming a cloud-based distributed system with microservices running on the server-cluster and multiple clients. In such a system, different authentication strategies are necessary to cover a variety of requirements regarding both, usability and security. We are working on a more detailed article on the topic of authentication which we will post here later. The goal of this post is to provide an overview over token-based authentication in InfluenzaNet and especially on how temporary tokens can be used in the new system.',
                'https://influenzanet.github.io/news/2019-05-17-temporary-tokens/',
              ),
              _newsItem(
                context,
                themeData,
                'Logo Party',
                'March 8, 2019',
                'A modern system should be represented by a modern logo. We envision a friendly, recognisable logo including an icon which can also be used separately from the text and comes in fresh looking colours. Of course it should be easily used in monochrome and be in harmony with modern design concepts like material design with a primary and secondary color. Apparently it is not an easy task to bring all the logical, functional and taste based opinions or arguments in our team together to a single decision. We already went though a few feedback rounds and wanted to share the first serious drafts with you so you can join the logo party.',
                'https://influenzanet.github.io/news/2019-03-08-logoparty/',
              ),
              Container(width: ThemeElements.pagePadding - (ThemeElements.connectedElementPadding / 2)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _newsItem(BuildContext context, ThemeData themeData, String title, String subtitle, String text, String url) {
    return Padding(
      padding: EdgeInsets.all(ThemeElements.connectedElementPadding / 2),
      child: Ink(
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(ThemeElements.cardBorderRadius)),
        width: 200,
        height: 200,
        child: InkWell(
          borderRadius: BorderRadius.circular(ThemeElements.cardBorderRadius),
          onTap: () {
            _openUrl(url);
          },
          child: Padding(
            padding: EdgeInsets.all(ThemeElements.connectedElementPadding),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  title,
                  style: themeData.textTheme.headline,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  subtitle,
                  style: themeData.textTheme.subhead,
                ),
                Container(height: ThemeElements.connectedElementPadding),
                Expanded(
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      print(constraints);
                      return Text(
                        text,
                        style: themeData.textTheme.body1,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        maxLines: (constraints.maxHeight /
                                    themeData.textTheme.body1.fontSize /
                                    MediaQuery.textScaleFactorOf(context))
                                .floor() -
                            1,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
