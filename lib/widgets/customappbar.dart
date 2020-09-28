import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0
  //@override
  //Size get preferredSize => Size.fromHeight(100.0);

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
