import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  toggleTheme() {
    if (_themeData == ThemeData.dark()) _themeData = ThemeData.light();
    else _themeData = ThemeData.dark();
    notifyListeners();
  }

  Brightness getBrightness() => (_themeData == ThemeData.dark()) ? Brightness.light : Brightness.dark;

  dynamic themeColors() => (_themeData == ThemeData.dark()) ? Colors.grey[850] : Colors.red;

  Icon getIcon() => (_themeData == ThemeData.dark()) ?
    Icon(
      Icons.wb_sunny,
      color: Colors.redAccent,
      semanticLabel: "qsldfsdlmf", //todo sqldjfqmlskdjfmslkdjf,
    ) :
    Icon(
      Icons.brightness_3,
      color: Colors.grey[850],
      semanticLabel: "qsldfsdlmf", //todo sqldjfqmlskdjfmslkdjf,
    );

  dynamic getLangColor() => (_themeData == ThemeData.dark()) ? Colors.red : Colors.grey[850];

  String getThemeName() => (_themeData == ThemeData.dark()) ? "dark_mode" : "light_mode" ;
}