import 'package:flutter/material.dart';

// ignore: unused_import
import '../../config/styles.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
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
