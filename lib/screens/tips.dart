import 'package:flutter/material.dart';

import '../widgets/screenappbar.dart';
import 'tips/tipexpanded.dart';
// ignore: unused_import
import "../config/styles.dart";
import "../type/tip.dart";

class TipsScreen extends StatefulWidget {
  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final tips = [
    new Tip(
      "Wear a mask!",
      "Wearing a face mask protects you and others from the spread of the coronavirus. It is one of the healthy reflexes that protects us all from the virus. You use a face mask to cover your nose and mouth. When you sneeze, cough or talk, droplets fly around. The face mask blocks the droplets. That way, there is less risk of making someone sick. In other words, wearing a face mask is primarily about protecting others.",
      "wearamask.jpg",
      "wearamask_2.jpg",
    ),
    new Tip(
      "Wash your hands!",
      "Washing your hands is the best way to stop germs from spreading. Think about all of the things that you touched today — from the telephone to the toilet. Maybe you blew your nose in a tissue and then went outside to dig around the dirt. Whatever you did today, you came into contact with germs. It's easy for a germ on your hand to end up in your mouth. Think about how many foods you eat with your hands. You can't wear rubber gloves all day long, but you can wash your hands so those germs don't get a chance to make you or someone else sick.",
      "washyourhands.jpg",
      "washyourhands_2.jpg",
    ),
    new Tip(
      "Placeholder",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "placeholder.png",
      "placeholder.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Tips"),
      body: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: tips.map((Tip tip) {
          return FlatButton(
            child: Image(
              image: AssetImage('assets/images/tips/' + tip.tipIconImage),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TipExpandedScreen(
                      tip.tipName, tip.tipText, tip.tipBannerImage),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
