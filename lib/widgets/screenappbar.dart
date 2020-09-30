import 'package:coronapp/config/styles.dart';
import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleOfScreen;

  @override
  final Size preferredSize; // default is 56.0
  //@override
  //Size get preferredSize => Size.fromHeight(100.0);

  ScreenAppBar(this.titleOfScreen, {
    Key key,
  })
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);


  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(
        context); // Theme

    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()), // Bij app openen is mode eerst op light
      child: new AppBar(
        //brightness: _themeChanger.getBrightness(), // THEMA TODO MORE?
        backgroundColor: _themeChanger.themeColors(), // THEMA
        title: Text(
          titleOfScreen,
          style: Styles.styleMainTitle,
        ),
      ),
    );
  }
}
