import 'package:flutter/material.dart';

// ignore: unused_import
import '../../config/styles.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Change language?"),
      ),
    );
  }
}
