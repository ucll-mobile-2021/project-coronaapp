/*
  Corona App
*/
import 'package:coronapp/screens/dashboard.dart';
import 'package:coronapp/screens/more.dart';
import 'package:coronapp/screens/statistics.dart';
import 'package:coronapp/screens/tips.dart';
import 'package:coronapp/widgets/customappbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(CoronaApp());

class CoronaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
      "title": "Dashboard",
      "screen": DashboardScreen(),
    },
    {
      "title": "Statistics",
      "screen": StatisticsScreen(),
    },
    {
      "title": "Tips",
      "screen": TipsScreen(),
    },
    {
      "title": "More",
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
              icon: Icon(Icons.dashboard),
              title: Text(screens[_currentIndex]["title"]),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.equalizer),
              title: Text(screens[_currentIndex]["title"]),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_help),
              title: Text(screens[_currentIndex]["title"]),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text(screens[_currentIndex]["title"]),
              backgroundColor: Colors.red),
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
