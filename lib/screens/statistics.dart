import 'dart:convert';

import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/type/coronastatistics.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http; //Zo kunnen we deze import met http aanspreken

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

Future<CoronaStatistics> fetchPost() async {
  final response = await http.get("https://covid19-stats-api.herokuapp.com/api/v1/cases?country=Belgium"); // TODO select land

  if  (response.statusCode == 200) {
    return CoronaStatistics.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load the post, try again later"); // TODO TRANSLATE
  }
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  
  final Future<CoronaStatistics> post = fetchPost();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'statistics')),
      body: Center(
         child: FutureBuilder<CoronaStatistics>(
          future: post,
          builder: (context, snapshot){
            if (snapshot.hasData) return Text(getTranslated(context, 'confirmed') + snapshot.data.confirmedcases.toString() + getTranslated(context, 'deaths')  + snapshot.data.deathcases.toString() + getTranslated(context, 'recovered') +snapshot.data.recovered.toString());
            else if (snapshot.hasError) return Text(getTranslated(context, 'marko_kliitzak')); // TODO vervangen door onderste lijn?
            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
