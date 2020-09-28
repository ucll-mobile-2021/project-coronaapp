import 'package:coronapp/config/styles.dart';
import 'package:flutter/material.dart';

class ScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleOfScreen;

  @override
  final Size preferredSize; // default is 56.0
  //@override
  //Size get preferredSize => Size.fromHeight(100.0);

  ScreenAppBar(
    this.titleOfScreen, {
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        titleOfScreen,
        style: Styles.styleMainTitle,
      ),
    );
  }
}
