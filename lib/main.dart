/*
  Corona App
*/
import 'package:coronapp/screens/dashboard.dart';
import 'package:coronapp/screens/latestnews.dart';
import 'package:coronapp/screens/more.dart';
import 'package:coronapp/screens/statistics.dart';
import 'package:coronapp/screens/tips.dart';
import 'package:coronapp/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/localization.dart';
import 'package:coronapp/localization/translation.dart';

void main() => runApp(CoronaApp());

class CoronaApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _CoronaAppState state = context.findAncestorStateOfType<_CoronaAppState>();
    state.setLocale(locale);
  }

  @override
  _CoronaAppState createState() => _CoronaAppState();
}

class _CoronaAppState extends State<CoronaApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) =>
          ThemeChanger(ThemeData.light()), // App openen met mode light
      child: new MaterialAppWithTheme(_locale),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  final _locale;

  MaterialAppWithTheme(this._locale);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    if (_locale == null)
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    else
      return MaterialApp(
        locale: _locale,
        supportedLocales: [
          Locale('en', 'GB'),
          Locale('fr', 'FR'),
          Locale('de', 'DE'),
          Locale('nl', 'BE'),
        ],
        localizationsDelegates: [
          Localization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale.languageCode &&
                locale.countryCode == deviceLocale.countryCode)
              return deviceLocale;
          }
          return supportedLocales.first;
        },
        theme: theme.getTheme(),
        home: BasicScreen(),
      );
  }
}

class BasicScreen extends StatefulWidget {
  @override
  _BasicScreenState createState() => _BasicScreenState();
}

class _BasicScreenState extends State<BasicScreen> {
  int _currentIndex = 0;

  final screens = [
    {
      "title": "dashboard",
      "screen": DashboardScreen(),
    },
    {
      "title": "statistics",
      "screen": StatisticsScreen(),
    },
    {
      "title": "latest_news",
      "screen": LatestNewsScreen(),
    },
    {
      "title": "tips",
      "screen": TipsScreen(),
    },
    {
      "title": "more",
      "screen": MoreScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: (screens[_currentIndex]["screen"] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            label: getTranslated(context, screens[_currentIndex]["title"]),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.equalizer,
              color: Colors.white,
            ),
            label: getTranslated(context, screens[_currentIndex]["title"]),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
              color: Colors.white,
            ),
            label: getTranslated(context, screens[_currentIndex]["title"]),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_help,
              color: Colors.white,
            ),
            label: getTranslated(context, screens[_currentIndex]["title"]),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            label: getTranslated(context, screens[_currentIndex]["title"]),
            backgroundColor: Colors.red,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
