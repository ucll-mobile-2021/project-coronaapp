import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/screens/latestnews/news_info.dart';
import 'package:coronapp/screens/latestnews/styles.dart';
import 'package:coronapp/type/new_detail.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LatestNewsScreen extends StatefulWidget {
  @override
  _LatestNewsScreenState createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  void initState() {
    super.initState();
    getNews();
  }

  final List<NewsDetail> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'latest_news',
        style: Styles.navBarTitle),
      ),
      body: ListView.builder(
          itemCount: this.items.length, itemBuilder: _listViewItemBuilder),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var newsDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(newsDetail),
        title: _itemTitle(newsDetail),
        onTap: () {
          _navigationToNewsDetail(context, newsDetail);
        });
  }

  void _navigationToNewsDetail(BuildContext context, NewsDetail newsDetail) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsInfo(newsDetail);
    }));
  }

  Widget _itemThumbnail(NewsDetail newsDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.url == null
          ? null
          : Image.network(newsDetail.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(NewsDetail newsDetail) {
    return Text(newsDetail.title, style: Styles.textDefault);
  }

  void getNews() async {
    final http.Response response = await http.get(
        "http://newsapi.org/v2/everything?q=Covid&from=2020-10-13&sortBy=popularity&apiKey=58e9f0e68be647bf965f6b601721de3b");
    //https://newsapi.org/v2/top-headlines?country=be&apiKey=58e9f0e68be647bf965f6b601721de3b
    //change key monthly

    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['articles'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
          description: newsDetail['description'],
          title: newsDetail['title'],
          url: newsDetail['urlToImage']);
      setState(() {
        items.add(news);
      });
    });
  }
}
