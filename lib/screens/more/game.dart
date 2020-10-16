import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/widgets/mypainter.dart';
import 'package:flutter/material.dart';

class GameTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Sensor sensor = new Sensor(size);

    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'game')),
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); /// go back
            sensor.stop(); /// om spel te stoppen
          },
        ),
      ),
      body: sensor,
    );
  }
}
