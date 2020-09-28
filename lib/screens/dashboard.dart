import 'package:coronapp/config/styles.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Dashboard"),
      body: Center(
        child: RaisedButton(
          child: Text(
            "Are you feeling sick?",
            style: Styles.styleButtonText,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FeelingSickPopUp(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FeelingSickPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I feel very... sick"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Go back!',
            style: Styles.styleButtonText,
          ),
        ),
      ),
    );
  }
}
