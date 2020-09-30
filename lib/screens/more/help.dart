import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: _themeChanger.themeColors(),
      ),
      body: Center(
        child: Text("Help"),
      ),
    );
  }
}
