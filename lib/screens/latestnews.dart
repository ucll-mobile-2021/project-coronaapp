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
      appBar: ScreenAppBar(
        getTranslated(context, 'latest_news', style: Styles.navBarTitle),
      ),
      body: ListView.builder(
        itemCount: this.items.length,
        itemBuilder: _listViewItemBuilder,
      ),
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
    return Text(newsDetail.title);
  }

  void getNews() async {
    // https://newsapi.org/
    final apikey = "382109a5f6d64cde90d302082d893465";
    final fromdate = "2020-12-26";
    final sortby = "popularity";
    final url = "http://newsapi.org/v2/everything?q=Covid&from=" +
        fromdate +
        "&sortBy=" +
        sortby +
        "&apiKey=" +
        apikey;
    final http.Response response = await http.get(url);
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['articles'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
          description: newsDetail['description'],
          title: newsDetail['title'],
          url: newsDetail['urlToImage'],
          urlToLink: newsDetail['url']);
      setState(() {
        items.add(news);
      });
    });
  }
}
