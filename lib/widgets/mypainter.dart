import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:coronapp/type/enemy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class Sensor extends StatefulWidget {
  final Size screenSize;

  Sensor(this.screenSize);

  void stop() {
    createState().stop();
  }

  @override
  _SensorState createState() => _SensorState(screenSize);
}

class _SensorState extends State<Sensor> {
  Color color = Colors.red;  // color of the circle
  AccelerometerEvent event; // event returned from accelerometer stream
  // hold a reference to these, so that they can be disposed
  Timer timer; // todo geen timer nodig?!
  StreamSubscription accel;
  double left;
  double width, height; // variables for screen size
  bool playing = false; // playing
  Canvas canvas; // todo gekregen van draw polygon, class shapepainter

  //Random rand;
  Size screenSize;
  double tileSize;
  List<Enemy> enemies = List<Enemy>(); // todo how
  State state;
  PictureRecorder recorder;
  int health = 50; //todo health
  bool dead = false;

  _SensorState(this.screenSize) {
    initVars();
    print("_sensorState"); //todo test
    while (enemies.length < 50) { // todo 50 enemies
      spawnEnemy();
    }
    print("50 enemies spawn"); //todo
  }

  void stop() {
    pauseTimer();
    health = 50; /// health terug max
    dead = false;
  }

/*  setColor(AccelerometerEvent event) {
    // Calculate Left
    double x = ((event.x * 12) + ((width - 100) / 2));
    // Calculate Top
    double y = event.y * 12 + 125;

    // find the difference from the target position
    var xDiff = x.abs() - ((width - 100) / 2);
    var yDiff = y.abs() - 125;

    // check if the circle is centered, currently allowing a buffer of 3 to make centering easier
    if (xDiff.abs() < 3 && yDiff.abs() < 3) setState(() {
        color = Colors.greenAccent;
        count += 1;
      });
    else {
      // set the color and restart count
      setState(() {
        color = Colors.red;
        count = 0;
      });
    }
  }*/

  setPosition(AccelerometerEvent event) {
    if (event == null) return;

    setState(() {
      left = ((event.x * 12) + ((width - 100) / 2));
    });

    // When y = 0 it should have a top position matching the target, which we set at 125
    /* setState(() { // todo dit gebruiken om enemies te laten bewegen
      top = event.y * 12 + 125;
    });*/
  }

  startTimer() {
    playing = true;
    // if the accelerometer subscription hasn't been created, go ahead and create it
    if (accel == null) {
      accel = accelerometerEvents.listen((AccelerometerEvent eve) {
        setState(() {
          event = eve;
        });
      });
    }
    else accel.resume();

    // Accelerometer events come faster than we need them so a timer is used to only process them every 200 milliseconds
    if (timer == null || !timer.isActive) {
      timer = Timer.periodic(Duration(milliseconds: 200), (_) {
        // todo check event not null
        if (event == null) event = AccelerometerEvent(0, 0, 0); //todo test // zelf event implementeren om error te voorkomen
        // process the current event
        //setColor(event);
        setPosition(event);
        /*if (count == 5) { // todo om de seconde spawnen
          spawnEnemy();
          count = 0;
        }
        else count++;*/
        // dood
        if (health <= 0) {
          stop();
          print("stopped");
          dead = true;
        }
        // enemy laten bewegen
        if (enemies.length != 0) {
          for (int i = 0; i < enemies.length; i++) {
            Offset enemyOffset = enemies[i].enemyOffset;
            if (enemyOffset.dy >= 565) {
              enemies[i].enemyOffset = Offset(enemyX(), enemyY()); /// wnr beneden, blokken weer boven
              enemies[i].checked = false; /// enemy not checked
            }
            else enemies[i].enemyOffset = Offset(enemyOffset.dx, enemyOffset.dy + 15); /// naar beneden
            if (touches(enemyOffset.dx, enemyOffset.dy) && !enemies[i].checked) {
              health--; /// bij het aanraken gaat de health naar beneden
              enemies[i].checked = true; /// enemy checked
            }
          }
        }
      });
    }
  }

  pauseTimer() {
    // stop the timer and pause the accelerometer stream
    if (timer != null) timer.cancel();
    if (accel != null) accel.pause();
    playing = false;
  }

  @override
  void dispose() { // todo used?
    timer?.cancel();
    accel?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // get the width and height of the screen
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              dead? Text("You died", style: TextStyle(fontSize: 50, color: Colors.white, backgroundColor: Theme.of(context).primaryColor), textAlign: TextAlign.center, textWidthBasis: TextWidthBasis.longestLine,) : Text(''), /// show text when dead
              // This empty container is given a width and height to set the size of the stack
              Container(
                height: height * 2.2/3,
                width: width,
              ),
              // This is the colored circle that will be moved by the accelerometer
              // the top and left are variables that will be set
              Positioned(
                top: 500,
                left: left ?? (width - 100) / 2,
                // the container has a color and is wrapped in a ClipOval to make it round
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: color,
                  ),
                ),
              ),
              /// enemies
              EnemyOval(0, enemies, Colors.red),
              EnemyOval(1, enemies, Colors.green),
              EnemyOval(2, enemies, Colors.yellow),
              EnemyOval(3, enemies, Colors.orange),
              EnemyOval(4, enemies, Colors.blue),
              EnemyOval(5, enemies, Colors.purple),
              EnemyOval(7, enemies, Colors.green),
              EnemyOval(8, enemies, Colors.orange),
              EnemyOval(9, enemies, Colors.yellow),
              EnemyOval(10, enemies, Colors.red),
              EnemyOval(11, enemies, Colors.purple),
              EnemyOval(12, enemies, Colors.blue),
              EnemyOval(13, enemies, Colors.green),
              EnemyOval(14, enemies, Colors.yellow),
              EnemyOval(15, enemies, Colors.orange),
              EnemyOval(16, enemies, Colors.red),
              EnemyOval(17, enemies, Colors.blue),
              EnemyOval(18, enemies, Colors.purple),
              EnemyOval(19, enemies, Colors.green),
              EnemyOval(20, enemies, Colors.yellow),
              EnemyOval(21, enemies, Colors.orange),
              EnemyOval(22, enemies, Colors.blue),
              EnemyOval(23, enemies, Colors.red),
              EnemyOval(24, enemies, Colors.yellow),
              EnemyOval(25, enemies, Colors.green),
              EnemyOval(26, enemies, Colors.purple),
              EnemyOval(27, enemies, Colors.blue),
              EnemyOval(28, enemies, Colors.red),
              EnemyOval(29, enemies, Colors.yellow),
              EnemyOval(30, enemies, Colors.orange),
              EnemyOval(31, enemies, Colors.orange),
              EnemyOval(32, enemies, Colors.purple),
              EnemyOval(33, enemies, Colors.blue),
              EnemyOval(34, enemies, Colors.orange),
              EnemyOval(35, enemies, Colors.red),
              EnemyOval(36, enemies, Colors.green),
              EnemyOval(37, enemies, Colors.yellow),
              EnemyOval(38, enemies, Colors.orange),
              EnemyOval(39, enemies, Colors.blue),
              EnemyOval(40, enemies, Colors.purple),
              EnemyOval(41, enemies, Colors.orange),
              EnemyOval(42, enemies, Colors.yellow),
              EnemyOval(43, enemies, Colors.red),
              EnemyOval(44, enemies, Colors.green),
              EnemyOval(45, enemies, Colors.orange),
              EnemyOval(46, enemies, Colors.purple),
              EnemyOval(47, enemies, Colors.blue),
              EnemyOval(48, enemies, Colors.red),
              EnemyOval(49, enemies, Colors.green),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0,),
            child: Column( children: <Widget>[
              Text(playing ? '' : 'Tilt your phone to avoid the dots'),
              RaisedButton(
                onPressed: () {
                  playing? pauseTimer() : startTimer();
                  if (dead) dead = false; /// reset game when dead and play again
                },
                child: Column(
                    children: <Widget>[
                      Text(playing ? 'Pause' : 'Play'),
                    ]
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
              Text("Health: " + health.toString(), style: TextStyle(fontSize: 30,),),
            ],
            ),
          ),
        ],
      ),
    );
  }

  //////////////////////////////////// enemy, ..
  // init variables


  void initVars() async {
    //screenSize = await Flame.util.initialDimensions();
    tileSize = screenSize.width / 10;
    canvas = new Canvas(new PictureRecorder());// todo difference 'new X()', 'X()' ??
    //todo test:

    Paint paint = Paint()..color = color;
    canvas.drawCircle(Offset(150, 150), 50, paint); // todo testtttttttttt
  }

  double enemyY() {
    /// x tss 0 en screensize.width - 40
    //double x = double.parse((Random().nextInt(screenSize.width.ceil() - 40)).toString());
    //double y = 10 - double.parse(Random().nextInt(screenSize.width.ceil() + 50).toString());
    Random rand = Random();
    double y;
    switch (rand.nextInt(12)) { // todo use this om regelmatige x, dat ze allemaal over de hele breedte vallen
      case 0:
      // Top
      //  x = 0; // todo x altijd op scherm (tussen linker en rechter limiet)
        y = -29; // tileSize / 2.5;
        break;
      case 1:
      // Right
      //x = screenSize.width + tileSize * 2.5;
        y = -78; // rand.nextDouble() / screenSize.height;
        break;
      case 2:
      // Bottom
      //x = rand.nextDouble() * screenSize.width;
        y = -121; // screenSize.height + tileSize / 2.5;
        break;
      case 3:
      // Left
      //x = -tileSize * 2.5;
        y = -209; // rand.nextDouble() / screenSize.height;
        break;
      case 4:
      //x = rand.nextDouble() * screenSize.width;
        y = -287; // rand.nextDouble() / screenSize.height + 10;
        break;
      case 5:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -314; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 6:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -339; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 7:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -397; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 8:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -442; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 9:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -509; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 10:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -480; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 11:
      //x = rand.nextDouble() * (screenSize.width - 40);
        y = -401; // rand.nextDouble() / screenSize.height + 50;
        break;
    }
    return y;
  }

  double enemyX() {
    Random rand = Random();
    double x;
    switch (rand.nextInt(12)) {  // todo use this om regelmatige x, dat ze allemaal over de hele breedte vallen
      case 0:
      // Top
        x = 0; // todo x altijd op scherm (tussen linker en rechter limiet)
        //  y = -20; // tileSize / 2.5;
        break;
      case 1:
      // Right
        x = screenSize.width + tileSize * 2.5;
        //y = -50; // rand.nextDouble() / screenSize.height;
        break;
      case 2:
      // Bottom
        x = rand.nextDouble() * screenSize.width;
        //y = -100; // screenSize.height + tileSize / 2.5;
        break;
      case 3:
      // Left
        x = -tileSize * 2.5;
        //y = - 200; // rand.nextDouble() / screenSize.height;
        break;
      case 4:
        x = rand.nextDouble() * screenSize.width;
        //y = -150; // rand.nextDouble() / screenSize.height + 10;
        break;
      case 5:
        x = rand.nextDouble() * (screenSize.width - 40);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 6:
        x = rand.nextDouble() * (screenSize.width - 60);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 7:
        x = rand.nextDouble() * (screenSize.width - 50);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 8:
        x = rand.nextDouble() * (screenSize.width - 5);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 9:
        x = rand.nextDouble() * (screenSize.width - 10);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 10:
        x = rand.nextDouble() * (screenSize.width - 20);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
      case 11:
        x = rand.nextDouble() * (screenSize.width - 30);
        //y = -300; // rand.nextDouble() / screenSize.height + 50;
        break;
    }
    return x;
  }

  void spawnEnemy() {
    enemies.add(Enemy(enemyX(), enemyY(), tileSize));
  }

  bool touches(double x, double y) { // true if enemy touches player
    // player x, y: top: 500, left: left ?? (width - 100) / 2,
    // diameter player: 40, middelpunt: (left??(width-100)/2) + 20 && top + 20 (=520)
    // diameter enemy: 20, middelpunt: offset + 10
    double horizontalDistance = (((left??(width-100)/2) + 20) - (x + 10)).abs(); // (middelpunt player) - (middelpunt enemy) abs
    double verticalDistance = (520 - (y + 10)).abs(); // (middelpunt player) - (middelpunt enemy) abs
    return (horizontalDistance <= 32 && verticalDistance <= 32); /// touch when max 2 px? apart
  }

/*  void render() { // canvas background
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    canvas.drawRect(background, backgroundPaint);

    if (!playing) {
      startText.render(canvas);  //todo
      highscoreText.render(canvas);
    }
    else {
      enemies.forEach((Enemy enemy) => enemy.render(canvas));
      scoreText.render(canvas);
      healthBar.render(canvas);
    }
  }*/
}

class EnemyOval extends StatelessWidget {
  final int index;
  final List<Enemy> enemies;
  final color;

  EnemyOval(this.index, this.enemies, this.color);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: enemies[index].enemyOffset.dy,
      left: enemies[index].enemyOffset.dx,
      // the container has a color and is wrapped in a ClipOval to make it round
      child: ClipOval(
        child: Container(
          width: 20,
          height: 20,
          color: color,
        ),
      ),
    );
  }
}
