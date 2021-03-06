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
  bool _darkmode = false;

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    CoronaApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    if (_themeChanger.getTheme() == ThemeData.dark()) {
      setState(() {
        _darkmode = true;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'settings')),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SwitchListTile(
            value: _darkmode,
            title: Text(getTranslated(context, "dark_mode")),
            secondary: _themeChanger.getIcon(),
            activeColor: Colors.white,
            onChanged: (value) {
              _themeChanger.toggleTheme();
              _darkmode = value;
            },
          ),
          ListTile(
            title: DropdownButton<Language>(
              hint: Text(getTranslated(context, 'change_lang'), style: TextStyle(color: _themeChanger.themeColors())),
              elevation: 16,
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
                        language.flag + " " + getTranslated(context, language.name),
                        style: TextStyle(fontSize: 30, wordSpacing: 15),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            leading: Icon(
              Icons.language,
            ),
          ),
        ],
      ),
    );
  }
}
