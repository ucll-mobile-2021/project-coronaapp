import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:coronapp/type/newsitem.dart';

class NewsExpandedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsExpandedScreenState();
}

class _NewsExpandedScreenState extends State<NewsExpandedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Expanded news item"),
    );
  }
}
