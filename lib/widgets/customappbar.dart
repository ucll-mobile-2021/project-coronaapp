import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0
  //@override
  //Size get preferredSize => Size.fromHeight(100.0);

  CustomAppBar({
    Key key,
  })
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return AppBar(
      backgroundColor: _themeChanger.themeColors(), // Theme
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 56,
            width: 56,
            fit: BoxFit.contain,
            image: AssetImage('assets/images/white-logo.png'),
          ),
        ],
      ),
    );
  }
}