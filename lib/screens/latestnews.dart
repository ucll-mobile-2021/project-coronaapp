import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LatestNewsScreen extends StatefulWidget {
  @override
  _LatestNewsScreenState createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'latest_news')),
      body: Container(
        child: Text("Test"),
      ),
    );
  }
}
