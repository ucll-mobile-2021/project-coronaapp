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

  dynamic themeColors() => (_themeData == ThemeData.dark()) ? Colors.white : Colors.grey[850];

  Icon getIcon() => (_themeData == ThemeData.dark()) ?
    Icon(
      Icons.brightness_3,
    ) :
    Icon(
      Icons.wb_sunny,
    );

  String getThemeName() => (_themeData == ThemeData.dark()) ? "dark_mode" : "light_mode" ;
}