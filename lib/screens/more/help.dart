import 'package:coronapp/localization/translation.dart';
import 'package:flutter/material.dart';

class HelpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'help')),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(getTranslated(context, 'help')),
      ),
    );
  }
}
 // TODO submenu appbar