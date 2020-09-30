import 'package:coronapp/type/language.dart';
import 'package:coronapp/config/theme.dart';
import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/main.dart';
import 'package:coronapp/type/language.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget { // I18N Stateful
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>(); // I18N

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void _changeLanguage(Language language) async { // I18N
    Locale _temp = await setLocale(language.languageCode);

    CoronaApp.setLocale(context, _temp); // I18N
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, 'settings')),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              Text(getTranslated(context, _themeChanger.getThemeName())),
              IconButton(
                onPressed: () => _themeChanger.toggleTheme(),
                icon: _themeChanger.getIcon(),
              ),
              Text(getTranslated(context, 'change_lang')),
              Padding( // I18N
                padding: EdgeInsets.all(8.0),
                child: DropdownButton(
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                  underline: SizedBox(),
                  icon: Icon(Icons.language, color: _themeChanger.getLangColor(),),
                  items: Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(lang.flag, style: TextStyle(fontSize: 30),),
                        Text(lang.name)
                      ],),
                  )).toList(),
                ),
              )
            ],
          ),
        )
    );
  }
}
