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
            title: Text(listOfMoreItems[index]["title"]), // TODO TRANSLATE
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
