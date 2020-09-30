import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: _themeChanger.themeColors(),
      ),
      body: Center(
        child: Text("Notifications"),
      ),
    );
  }
}
