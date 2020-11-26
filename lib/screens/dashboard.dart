import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/type/greeting.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // uses dep url_launcher
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {



  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  // https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code
  _launchURL() async {
    const url = 'https://www.info-coronavirus.be/nl/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // https://stackoverflow.com/questions/43149073/how-can-i-dial-the-phone-from-flutter
  _launchCaller() async {
    const url = "tel:1234567";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  final Widget _feelingSickSection =
     Container(
      /*width: width,
      height: height/3,*/
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16)
          )
      ),
    );

  final Widget _formSection =
  Container(
    /*width: width,
      height: height/3,*/
    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16)
        )
    ),
  );

  final Widget _coronalertSection =
  Container(
    /*width: width,
      height: height/3,*/
    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16)
        )
    ),
  );

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

  /*Widget _buildFeelingSickSectionCard(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text(getTranslated(context, 'feeling_sick'),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            FlatButton.icon(
              label: Text("Call"),
              icon: Icon(Icons.call),
              onPressed: _launchCaller,
            ),
            FlatButton.icon(
              label: Text("Website"),
              icon: Icon(Icons.public),
              onPressed: _launchURL,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu, color: Colors.white,),
            ),
          ],
        )
      ],
    );
  }
 */


  Widget _buildItemCard(Widget section, String title){
    if (title == 'feeling_sick'){
      return Container(
          width: 120,
          height: 145,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20
                )
              ]
          ),
          child: Column(
            children: [Text(getTranslated(context, title)), section,
              FlatButton.icon(
                label: Text("Call"),
                icon: Icon(Icons.call),
                onPressed: _launchCaller,
              ),
             ],
          )
      );
    } else if (title == 'going_trip'){
      return Container(
          width: 120,
          height: 145,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20
                )
              ]
          ),
          child: Column(
            children: [Text(getTranslated(context, title)), section,
              FlatButton.icon(
                label: Text("More info"),
                icon: Icon(Icons.info_outline),
                onPressed: _launchFormItSelf,
              ),
            ],
          )
      );
    }
    else if (title == 'corona_alertapp'){
      return Container(
          width: 120,
          height: 145,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          margin: EdgeInsets.only(left: 32, right: 32, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20
                )
              ]
          ),
          child: Column(
            children: [Text(getTranslated(context, title)), section,
              FlatButton.icon(
                label: Text("Get the app!"),
                icon: Icon(Icons.public),
                onPressed: _launchCoronaAlertDownloadPage,
              ),
            ],
          )
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final sections = [
      {
        "title": "feeling_sick",
        "card": _feelingSickSection,
      },
      {
        "title": "going_trip",
        "card": _formSection,
      },
      {
        "title": "corona_alertapp",
        "card": _coronalertSection,
      }
    ];



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ScreenAppBar(getTranslated(context, 'dashboard')),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        child: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index){
          return _buildItemCard(sections[index]["card"] as Widget,  sections[index]["title"]);
        }
      ),
      ),
    );
  }
}