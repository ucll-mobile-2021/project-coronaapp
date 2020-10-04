import 'package:coronapp/widgets/mypainter.dart';
import 'package:flutter/material.dart';

class GameTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Sensor sensor = new Sensor(size);

    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // todo go back
            sensor.stop(); // todo om spel te stoppen
          },
        ),
      ),
      body: sensor, /*SafeArea( // todo use painter somewhere
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomPaint(
                painter: ShapePainter(10, 20, 30), // todo zo maken we shapepainter
                child: Container(),
              )
          ],
        ),
      ),*/
    );
  }
}
