import 'package:coronapp/config/theme.dart';
import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  _launchCaller() async {
    const url = "tel:1234567";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _feelingSickSection(ThemeChanger themeChanger) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: getBackgroundColor(themeChanger),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
    );
  }

  Widget _formSection(ThemeChanger themeChanger) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: getBackgroundColor(themeChanger),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
    );
  }

  Widget _coronalertSection(ThemeChanger themeChanger) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        color: getBackgroundColor(themeChanger),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
    );
  }

  _launchFormItSelf() async {
    const url =
        'https://travel.info-coronavirus.be/public-health-passenger-locator-form';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCoronaAlertDownloadPage() async {
    const url =
        'https://play.google.com/store/apps/details?id=be.sciensano.coronalert&gl=BE';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color getBackgroundColor(ThemeChanger themeChanger) {
    if (themeChanger.getTheme() == ThemeData.light())
      return Colors.white;
    else
      return Colors.grey[150];
  }

  final TextStyle _styleTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  Widget _buildItemCard(
      Widget section, String title, ThemeChanger themeChanger) {
    if (title == 'feeling_sick') {
      return Container(
        width: 120,
        height: 145,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: getBackgroundColor(themeChanger),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: Column(
          children: [
            Text(getTranslated(context, title), style: _styleTitle),
            section,
            FlatButton.icon(
              label: Text("Call"),
              icon: Icon(Icons.call),
              onPressed: _launchCaller,
            ),
          ],
        ),
      );
    } else if (title == 'going_trip') {
      return Container(
        width: 120,
        height: 145,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: getBackgroundColor(themeChanger),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: Column(
          children: [
            Text(getTranslated(context, title), style: _styleTitle),
            section,
            FlatButton.icon(
              label: Text("More info"),
              icon: Icon(Icons.info_outline),
              onPressed: _launchFormItSelf,
            ),
          ],
        ),
      );
    } else if (title == 'corona_alertapp') {
      return Container(
        width: 120,
        height: 145,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: getBackgroundColor(themeChanger),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: Column(
          children: [
            Text(getTranslated(context, title), style: _styleTitle),
            section,
            FlatButton.icon(
              label: Text("Get the app!"),
              icon: Icon(Icons.public),
              onPressed: _launchCoronaAlertDownloadPage,
            ),
          ],
        ),
      );
    } else {
      // Empty container if title is not given in this if
      return Container(
        width: 120,
        height: 145,
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)]),
        child: Text("", style: _styleTitle),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    final sections = [
      {
        "title": "feeling_sick",
        "card": _feelingSickSection(_themeChanger),
      },
      {
        "title": "going_trip",
        "card": _formSection(_themeChanger),
      },
      {
        "title": "corona_alertapp",
        "card": _coronalertSection(_themeChanger),
      }
    ];

    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'dashboard')),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return _buildItemCard(
              sections[index]["card"] as Widget,
              sections[index]["title"],
              _themeChanger,
            );
          },
        ),
      ),
    );
  }
}
