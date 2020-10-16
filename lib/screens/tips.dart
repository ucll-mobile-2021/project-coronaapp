import 'package:coronapp/localization/translation.dart';
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
      "wear_mask",
      "wearing_mask_protects",
      "wearamask.jpg",
      "wearamask_2.jpg",
    ),
    new Tip(
      "wash_hands",
      "washing_your_hands",
      "washyourhands.jpg",
      "washyourhands_2.jpg",
    ),
    new Tip(
      "social_distancing",
      "physical_distancing",
      "sociald.jpg",
      "social_2.png",
    ),
    new Tip(
      "dont_touch",
      "prevent_infections",
      "dont.png",
      "dont_2.jpg",
    ),
    new Tip(
      "stay_home",
      "most_sick",
      "stayhome.jpg",
      "stayhome_2.png",
    ),
    new Tip(
      "sneeze_cough",
      "sneezing",
      "sneezeelbow.png",
      "sneezeelbow_2.png",
    ),
    new Tip(
      "contact_general_practitioner",
      "contacting_doctor",
      "genprac.jpg",
      "genprac_2.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'tips')),
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
                    getTranslated(context, tip.tipName),
                    getTranslated(context, tip.tipText),
                    tip.tipBannerImage,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
