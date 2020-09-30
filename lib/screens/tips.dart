import 'package:coronapp/screens/tips/tipexpanded.dart';
import 'package:coronapp/type/tip.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';


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
      "Social distancing!",
      "Social distancing, also called “physical distancing,” means keeping a safe space between yourself and other people who are not from your household. To practice social or physical distancing, stay at least 6 feet (about 2 arms' length) from other people who are not from your household in both indoor and outdoor spaces.",
      "sociald.jpg",
      "social_2.png",
    ),
    new Tip(
      "Don't touch your nose, eyes and mouth!",
      "To help prevent infections, keep your hands away from your eyes, nose, and mouth. Why? Touching the mucous membranes on your face with your dirty hands allows germs that cause respiratory infections to enter the body.",
      "dont.png",
      "dont_2.jpg",
    ),
    new Tip(
      "Stay at home when you feel sick!",
      "Most people with COVID-19 have mild illness and can recover at home without medical care. Do not leave your home, except to get medical care. Do not visit public areas.",
      "stayhome.jpg",
      "stayhome_2.png",
    ),
    new Tip(
      "Nies en hoest in je elleboog",
      "When sneezing all your body fluids spatter around in a one-mile radius. Do not visit public areas.",
      "stayhome.jpg",
      "stayhome_2.png",
    )
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
