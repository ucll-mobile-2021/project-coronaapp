import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/screens/more/faq.dart';
import 'package:coronapp/screens/more/help.dart';
import 'package:coronapp/screens/more/info.dart';
import 'package:coronapp/screens/more/notifications.dart';
import 'package:coronapp/screens/more/settings.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import "../config/styles.dart";

class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final listOfMoreItems = [
    {
      "title": "help",
      "icon": Icons.help,
      "info": "call_911",
      "tab": HelpTab(),
    },
    {
      "title": "faq",
      "icon": Icons.question_answer,
      "info": "f_a_q",
      "tab": FaqTab(),
    },
    {
      "title": "notifications",
      "icon": Icons.notifications,
      "info": "change_notif",
      "tab": NotificationsTab(),
    },
    {
      "title": "settings",
      "icon": Icons.settings,
      "info": "want_change",
      "tab": SettingsTab(),
    },
    {
      "title": "info",
      "icon": Icons.info,
      "info": "about",
      "tab": InfoTab(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'more')),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: listOfMoreItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              listOfMoreItems[index]["icon"],
              color: Colors.red[400],
            ),
            title: Text(getTranslated(context, listOfMoreItems[index]["title"])),
            trailing: Icon(Icons.keyboard_arrow_right),
            subtitle: Text(getTranslated(context, listOfMoreItems[index]["info"])),
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
