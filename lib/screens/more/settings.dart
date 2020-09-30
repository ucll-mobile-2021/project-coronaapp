import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            Text(_themeChanger.getThemeName()),
            IconButton(
              onPressed: () => _themeChanger.toggleTheme(),
              icon: _themeChanger.getIcon(),
            ),
            Text("Change language?"),
          ],
          /*children: <Widget>[
            Text("Change language?"),
            IconButton(
              onPressed: () => _themeChanger.toggleTheme(),
              icon: _themeChanger.getIcon(),
            )
          ],*/
        ),
      )
    );
  }
}
