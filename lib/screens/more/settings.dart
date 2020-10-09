import 'package:coronapp/type/language.dart';
import 'package:coronapp/config/theme.dart';
import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  // ignore: unused_field
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool toggleSwitch = false;

  // ignore: unused_element
  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    CoronaApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'settings')),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SwitchListTile(
            value: toggleSwitch,
            title: Text(getTranslated(context, _themeChanger.getThemeName())),
            onChanged: (value) {
              _themeChanger.toggleTheme();
              toggleSwitch = value;
            },
          ),
          ListTile( title: DropdownButton<Language>(
            hint: Text(getTranslated(context, 'change_lang')),
            icon: Icon(
              Icons.language,
              color: _themeChanger.getLangColor(),
            ),
            iconSize: 24,
            elevation: 16,
          // style: TextStyle(
          //     color: Colors.deepPurple
          // ),
            underline: Container(
              height: 0,
            ),
            onChanged: (Language language) {
              setState(() {
                _changeLanguage(language);
              });
            },
            items: Language.languageList().map<DropdownMenuItem<Language>>((Language language) {
              return DropdownMenuItem<Language>(
                value: language,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      language.flag,
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(language.name)
                  ],
                ),
              );
            }).toList(),
          ),),
        ],
      )
    );
  }
}
