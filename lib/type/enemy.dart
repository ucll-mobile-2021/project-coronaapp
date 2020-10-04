import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class Enemy {
  double speed;
  Rect enemyRect;// todo weg
  Offset enemyOffset; // todo test
  /// Om de x seconden check ik of een enemy te dicht bij de speler komt, zo ja verminder ik de health
  /// probleem: zelfde enemy wordt meerdere keren gecheckt waardoor een enemy 10 punten health afneemt.
  /// Hier tegen: bool checked. True als deze gecheckt is
  bool checked = false;

  Enemy(double x, double y, double tileSize) {
    speed = tileSize * 2;
    /*enemyRect = Rect.fromLTWH(x, y, // todo weg
      tileSize * 0.6, //1.2,
      tileSize * 0.6, //1.2,
    );*/
    enemyOffset = Offset(x, y); // todo test
  }

/*  void update(double t) {
    if (!isDead) {
      double stepDistance = speed * t;
      Offset toPlayer =
          gameController.player.playerRect.center - enemyRect.center;
      if (stepDistance <= toPlayer.distance - gameController.tileSize * 1.25) {
        Offset stepToPlayer =
            Offset.fromDirection(toPlayer.direction, stepDistance);
        enemyRect = enemyRect.shift(stepToPlayer);
      } else {
        attack();
      }
    }
  }*/

  void attack() {
    /*if (!gameController.player.isDead) { todo get levenspunten
      gameController.player.currentHealth -= damage;
    }*/
  }
}

