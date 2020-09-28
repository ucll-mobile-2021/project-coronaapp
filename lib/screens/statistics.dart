import 'dart:convert';

import 'package:coronapp/type/coronastatistics.dart';
import 'package:flutter/material.dart';

import '../widgets/screenappbar.dart';
// ignore: unused_import
import "../config/styles.dart";
import 'package:http/http.dart' as http; //Zo kunnen we deze import met http aanspreken

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
  
}

Future<CoronaStatistics> fetchPost() async {
  final response = await http.get("https://covid19-stats-api.herokuapp.com/api/v1/cases?country=Belgium");

  if  (response.statusCode == 200) {
    return CoronaStatistics.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load the post, try again later");
  }

}

class _StatisticsScreenState extends State<StatisticsScreen> {
  
  final Future<CoronaStatistics> post = fetchPost();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar("Statistics"),
      body: Center(
         child: FutureBuilder<CoronaStatistics>(
          future: post,
          builder: (context, snapshot){
            if (snapshot.hasData){
              return Text("Confirmed Cases: " + snapshot.data.confirmedcases.toString() + "\nDeaths: "  + snapshot.data.deathcases.toString() + "\nRecovered: " +snapshot.data.recovered.toString());
            } else if (snapshot.hasError) {
              return Text("Marko is een zieke kliitzak");
            }

            return CircularProgressIndicator();
          }
        ),
        
      ),
    );
  }
}
