import 'package:InfluenzaNet/ui/common/themes/influenzanet-theme.dart';
import 'package:InfluenzaNet/ui/common/widgets/buttons/themed-secondary-button.dart';
import 'package:InfluenzaNet/ui/common/widgets/pages/scaffold-page.dart';
import 'package:flutter/material.dart';

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
              ),
              _newsItem(context, themeData, 'Token-based Authentication', 'May 17, 2019',
                  'InfluenzaNet is becoming a cloud-based distributed system with microservices running on the server-cluster and multiple clients. In such a system, different authentication strategies are necessary to cover a variety of requirements regarding both, usability and security. We are working on a more detailed article on the topic of authentication which we will post here later. The goal of this post is to provide an overview over token-based authentication in InfluenzaNet and especially on how temporary tokens can be used in the new system.'),
              _newsItem(context, themeData, 'Logo Party', 'March 8, 2019',
                  'A modern system should be represented by a modern logo. We envision a friendly, recognisable logo including an icon which can also be used separately from the text and comes in fresh looking colours. Of course it should be easily used in monochrome and be in harmony with modern design concepts like material design with a primary and secondary color. Apparently it is not an easy task to bring all the logical, functional and taste based opinions or arguments in our team together to a single decision. We already went though a few feedback rounds and wanted to share the first serious drafts with you so you can join the logo party.'),
              Container(width: ThemeElements.pagePadding - (ThemeElements.connectedElementPadding / 2)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _newsItem(BuildContext context, ThemeData themeData, String title, String subtitle, String text) {
    return Container(
      margin: EdgeInsets.all(ThemeElements.connectedElementPadding / 2),
      padding: EdgeInsets.all(ThemeElements.connectedElementPadding),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      width: 200,
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            style: themeData.textTheme.headline,
          ),
          Text(
            subtitle,
            style: themeData.textTheme.subhead,
          ),
          Spacer(),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
