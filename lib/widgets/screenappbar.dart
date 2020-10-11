import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleOfScreen;

  @override
  final Size preferredSize; // default is 56.0

  ScreenAppBar(
    this.titleOfScreen, {
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    Color getBackgroundColor(ThemeChanger themeChanger) {
      if (themeChanger.getTheme() == ThemeData.light()) {
        return Colors.white10;
      } else {
        return Colors.grey[850];
      }
    }

    Color getTextColor(ThemeChanger themeChanger) {
      if (themeChanger.getTheme() == ThemeData.light()) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    }

    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: new AppBar(
        brightness: _themeChanger.getBrightness(),
        backgroundColor: getBackgroundColor(_themeChanger),
        elevation: 0.0,
        title: Text(
          titleOfScreen,
          style: TextStyle(
            color: getTextColor(_themeChanger),
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
