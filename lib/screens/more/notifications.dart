import 'package:coronapp/localization/translation.dart';
import 'package:flutter/material.dart';

class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'notifications')),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(getTranslated(context, 'notifications')),
      ),
    );
  }
}
