import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/screens/dashboard/latestnews.dart';
import 'package:coronapp/type/greeting.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // uses dep url_launcher

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _greetingMessage() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          getTranslated(context, Greeting.random()),
          style: TextStyle(
            color: Colors.red,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _feelingSickSection() {
    final Widget _areYouFeelingSick = Align(
      alignment: Alignment.topLeft,
      child: Text(
        getTranslated(context, 'feeling_sick'),
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final Widget _ifYouHaveAnyCOVIDRelatedSymptoms = Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        getTranslated(context, 'symptoms') +
            getTranslated(context, 'local_practitioner'),
        style: TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
    );

    // https://stackoverflow.com/questions/43149055/how-do-i-open-a-web-browser-url-from-my-flutter-code
    _launchURL() async {
      String url = getTranslated(
          context, 'covid_url'); // string om van taal te veranderen
      if (await canLaunch(url))
        await launch(url);
      else
        throw 'Could not launch $url';
    }

    // https://stackoverflow.com/questions/43149073/how-can-i-dial-the-phone-from-flutter
    _launchCaller() async {
      const url = "tel:1234567";
      if (await canLaunch(url))
        await launch(url);
      else
        throw 'Could not launch $url';
    }

    final Widget _buttons = Row(
      children: [
        FlatButton.icon(
          label: Text(getTranslated(context, 'call')),
          icon: Icon(Icons.call),
          onPressed: _launchCaller,
        ),
        FlatButton.icon(
          label: Text(getTranslated(context, 'website')),
          icon: Icon(Icons.public),
          onPressed: _launchURL,
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          _areYouFeelingSick,
          _ifYouHaveAnyCOVIDRelatedSymptoms,
          _buttons,
        ],
      ),
    );
  }

  Widget _passengerLocatorForm() {
    final Widget _text = Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            getTranslated(context, 'going_trip'),
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            getTranslated(context, 'phpl'),
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );

    _launchInformationForm() async {
      String url = getTranslated(context, 'plf_url');
      if (await canLaunch(url))
        await launch(url);
      else
        throw 'Could not launch $url';
    }

    _launchFormItSelf() async {
      String url = getTranslated(context, 'phpl_url');
      if (await canLaunch(url))
        await launch(url);
      else
        throw 'Could not launch $url';
    }

    final Widget _buttons = Row(
      children: [
        FlatButton.icon(
          label: Text(getTranslated(context, 'more_info')),
          icon: Icon(Icons.info_outline),
          onPressed: _launchInformationForm,
        ),
        FlatButton.icon(
          label: Text(getTranslated(context, 'form')),
          icon: Icon(Icons.dehaze),
          onPressed: _launchFormItSelf,
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          _text,
          _buttons,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'dashboard')),
      body: ListView(
        children: [
          _greetingMessage(),
          _feelingSickSection(),
          _passengerLocatorForm(),
          LatestNews(),
        ],
      ),
    );
  }
}
