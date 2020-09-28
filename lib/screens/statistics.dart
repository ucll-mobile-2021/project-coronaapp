import 'package:flutter/material.dart';

import '../widgets/screenappbar.dart';
// ignore: unused_import
import "../config/styles.dart";

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Statistics"),
      body: Center(
        child: Text('Statistics'),
      ),
    );
  }
}
