import 'package:coronapp/localization/translation.dart';
import 'package:flutter/material.dart';

class InfoTab extends StatelessWidget {
  final informationItems = [
    {
      "key": "name",
      "value": "corona_app",
    },
    {
      "key": "version",
      "value": "version_value",
    },
    {
      "key": "made_for",
      "value": "best_teacher",
    },
    {
      "key": "made_with_love",
      "value": "group",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: informationItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(
              getTranslated(context, informationItems[index]["key"]),
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(getTranslated(context, informationItems[index]["value"])),
          );
        },
      ),
    );
  }
}
