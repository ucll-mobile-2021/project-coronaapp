import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
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
