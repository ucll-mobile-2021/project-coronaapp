import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoTab extends StatelessWidget {
  final informationItems = [
    {
      "key": "Name",
      "value": "Corona App",
    },
    {
      "key": "Version",
      "value": "1.0.1 (20/12/2020)",
    },
    {
      "key": "Made for",
      "value": "Frédéric Vogels, the best teacher",
    },
    {
      "key": "Made with <3 by",
      "value": "Nick, Marko, Max, Yannick",
    },
  ];

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        backgroundColor: _themeChanger.themeColors(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: informationItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              informationItems[index]["key"],
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(informationItems[index]["value"]),
          );
        },
      ),
    );
  }
}
