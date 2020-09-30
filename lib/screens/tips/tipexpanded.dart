import 'package:coronapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TipExpandedScreen extends StatelessWidget {
  final String _tipName;
  final String _tipText;
  final String _tipBannerImage;

  TipExpandedScreen(this._tipName, this._tipText, this._tipBannerImage);

  Widget bannerSection(String imageName) {
    return Image.asset(
      'assets/images/tips/' + imageName,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }

  Widget nameSection(String name) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textSection(String text) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(
          fontSize: 19.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context); // Theme

    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
        backgroundColor: _themeChanger.themeColors(),
      ),
      body: ListView(
        children: [
          bannerSection(_tipBannerImage),
          nameSection(_tipName),
          textSection(_tipText),
        ],
      ),
    );
  }
}
