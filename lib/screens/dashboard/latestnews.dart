import 'package:coronapp/localization/translation.dart';
import 'package:flutter/widgets.dart';

// https://www.info-coronavirus.be/en/news/
// UL LIST CLASS => "blog-list"

/*
<ul class="blog-list">
    <li>
        <div class="blue">28-09-2020: <a href="/en/news/increase-in-the-number-of-daily-infections-but-less-pronounced/">Increase in the number of daily infections but less pronounced</a></div>
    </li>
</ul>
*/

class LatestNews extends StatefulWidget {
  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(getTranslated(context, 'latest_news')),
    );
  }
}
