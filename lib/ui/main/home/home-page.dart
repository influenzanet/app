import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/cards/themed-card.dart';
import 'package:InfluenzaNet/ui/common/widgets/lists/horizontal-list.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/list-page.dart';
import 'package:InfluenzaNet/ui/main/main-navigator.dart';
import 'package:InfluenzaNet/ui/main/news/news-item.dart';
import 'package:flutter/material.dart';

class HomePage extends ListPage {
  HomePage() : super(titleText: 'Home');

  @override
  List<Widget> buildChildren(BuildContext context, ThemeData themeData) {
    ThemeData themeData = Theme.of(context);
    return <Widget>[
      Container(height: ThemeElements.pagePadding),
      _quickActions(context, themeData),
      Container(height: ThemeElements.elementPadding),
      _news(context),
      Container(height: ThemeElements.elementPadding),
      _history(context, themeData),
    ];
  }

  Widget _quickActions(BuildContext context, ThemeData themeData) {
    return HorizontalList(
      titleText: 'Quick Report',
      height: 90,
      children: <Widget>[
        _quickActionItem(themeData, 'Sickness', Colors.teal),
        _quickActionItem(themeData, 'Injury', Colors.pink),
        _quickActionItem(themeData, 'Household Members', Colors.brown),
        _quickActionItem(themeData, 'Visit to Doctor', Colors.blue),
        _quickActionItem(themeData, 'Hospital', Colors.orange),
        _quickActionItem(themeData, 'Vaccination', Colors.green),
      ],
    );
  }

  Widget _quickActionItem(ThemeData themeData, String text, MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.all(ThemeElements.listItemPadding),
      child: ThemedCard(
        color: color[400],
        splashColor: color[700],
        width: 135,
        height: 90,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(ThemeElements.connectedElementPadding),
          child: Center(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: themeData.textTheme.title.apply(color: Colors.white),
          )),
        ),
      ),
    );
  }

  Widget _news(BuildContext context) {
    return HorizontalList(
      titleText: 'News',
      height: 205,
      onViewAllPressed: () {
        Navigator.of(context).pushNamed(MainNavigator.homeNewsRoute);
      },
      children: <Widget>[
        _newsItem(
          'Automated Testing',
          'May 21, 2019',
          'When it comes to delivering a product to customers, every company would make sure that the outcome meets certain quality criteria before handing it over. This is because as human beings we are prone to make mistakes, and no matter how hard we try to keep every aspect and little detail in mind, we might still end up missing a key point or make a small mistake that is going to cost us a lot in later phases.',
          'https://influenzanet.github.io/news/2019-05-21-automatic-testing/',
        ),
        _newsItem(
          'Token-based Authentication',
          'May 17, 2019',
          'InfluenzaNet is becoming a cloud-based distributed system with microservices running on the server-cluster and multiple clients. In such a system, different authentication strategies are necessary to cover a variety of requirements regarding both, usability and security. We are working on a more detailed article on the topic of authentication which we will post here later. The goal of this post is to provide an overview over token-based authentication in InfluenzaNet and especially on how temporary tokens can be used in the new system.',
          'https://influenzanet.github.io/news/2019-05-17-temporary-tokens/',
        ),
        _newsItem(
          'Logo Party',
          'March 8, 2019',
          'A modern system should be represented by a modern logo. We envision a friendly, recognisable logo including an icon which can also be used separately from the text and comes in fresh looking colours. Of course it should be easily used in monochrome and be in harmony with modern design concepts like material design with a primary and secondary color. Apparently it is not an easy task to bring all the logical, functional and taste based opinions or arguments in our team together to a single decision. We already went though a few feedback rounds and wanted to share the first serious drafts with you so you can join the logo party.',
          'https://influenzanet.github.io/news/2019-03-08-logoparty/',
        ),
      ],
    );
  }

  Widget _newsItem(String title, String subtitle, String text, String url) {
    return Padding(
      padding: const EdgeInsets.all(ThemeElements.listItemPadding),
      child: NewsItem(
        title: title,
        subtitle: subtitle,
        text: text,
        url: url,
        width: 205,
        height: 205 - ThemeElements.listItemPadding * 2,
      ),
    );
  }

  Widget _history(BuildContext context, ThemeData themeData) {
    return HorizontalList(
      titleText: 'Your History',
      height: 85,
      onViewAllPressed: () {},
      children: <Widget>[
        _historyItem(themeData, '3 Days', 'Coughing', Colors.teal),
        _historyItem(themeData, '10 KM', 'Running', Colors.orange),
        _historyItem(themeData, '8 Hours', 'Sleeping', Colors.blue),
      ],
    );
  }

  Widget _historyItem(ThemeData themeData, String data, String dataType, Color color) {
    return Padding(
      padding: EdgeInsets.all(ThemeElements.listItemPadding),
      child: ThemedCard(
        color: Colors.white,
        width: 105,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data,
              style: themeData.textTheme.title,
              textAlign: TextAlign.center,
            ),
            Text(
              dataType,
              style: themeData.textTheme.title.apply(color: color),
            )
          ],
        ),
      ),
    );
  }
}
