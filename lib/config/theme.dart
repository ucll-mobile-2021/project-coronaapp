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

  Brightness getBrightness() {
    return _themeData == ThemeData.dark() ? Brightness.light : Brightness.dark;
  }

  dynamic themeColors() {
    // ignore: unnecessary_statements
    return (_themeData == ThemeData.dark()) ? Colors.grey[850] : Colors.blue;
  }

  Icon getIcon() {
    return (_themeData == ThemeData.dark()) ?
    Icon(
      Icons.brightness_3,
      color: Colors.redAccent,
    ) :
    Icon(
      Icons.wb_sunny,
      color: Colors.grey[850],
    );
  }
}