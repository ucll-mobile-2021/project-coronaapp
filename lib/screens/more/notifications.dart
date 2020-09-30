import 'package:flutter/material.dart';


class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text("Notifications"),
      ),
    );
  }
}
