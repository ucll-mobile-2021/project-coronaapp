import 'package:flutter/material.dart';

import '../widgets/screenappbar.dart';
// ignore: unused_import
import "../config/styles.dart";

// Tabs
import 'more/help.dart';
import 'more/notifications.dart';
import 'more/settings.dart';
import 'more/info.dart';
import 'more/faq.dart';

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final listOfMoreItems = [
    {
      "title": "Help",
      "icon": Icons.help,
      "info": "Call 911... oh wait don't do that",
      "tab": HelpTab(),
    },
    {
      "title": "FAQ",
      "icon": Icons.question_answer,
      "info": "Frequently Asked Questions",
      "tab": FaqTab(),
    },
    {
      "title": "Notifications",
      "icon": Icons.notifications,
      "info": "Change notifications",
      "tab": NotificationsTab(),
    },
    {
      "title": "Settings",
      "icon": Icons.settings,
      "info": "Want to change something?",
      "tab": SettingsTab(),
    },
    {
      "title": "Info",
      "icon": Icons.info,
      "info": "About the app",
      "tab": InfoTab(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("More"),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listOfMoreItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              listOfMoreItems[index]["icon"],
              color: Colors.red[400],
            ),
            title: Text(listOfMoreItems[index]["title"]),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle: Text(listOfMoreItems[index]["info"]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      (listOfMoreItems[index]["tab"] as Widget),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
