import 'dart:convert';
import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/type/coronastatistics.dart';
import 'package:coronapp/type/country_list_pick.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //Zo kunnen we deze import met http aanspreken
import 'dart:async';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();

  final GetCountry getCountry = GetCountry();
}

Future<CoronaStatistics> fetchPost(String code) async {
  if (code == null) throw Exception("Code is null"); //todo
  if (code == "") code = "Belgium%BE"; // todo eerste call (in _statisticsScreenState) met lege parameter
  else print("fetch code: " + code); // todo if usa -> get us // anders geeft

  String thisCode = code.split("%")[0];
  if (thisCode == "United States") thisCode = "US"; // todo om us te zien
  else if (thisCode == "Congo") thisCode = "Congo (Brazzaville)";
  else if (thisCode == "Czech Republic") thisCode = "Czechia";
  final response = await http.get("https://covid19-stats-api.herokuapp.com/api/v1/cases?country=" + thisCode); //" + country); // TODO select land

  if (response.statusCode == 200)  return CoronaStatistics.fromJson(json.decode(response.body));
  //else return CoronaStatistics.fromJson(json.decode('{"confirmed":"???","deaths":"???","recovered":"???"}')); //throw Exception("Failed to load the post, try again later"); // TODO TRANSLATE
  else return CoronaStatistics.fromJson(json.decode('{"confirmed":"Info","deaths":"Not","recovered":"Found"}')); //throw Exception("Failed to load the post, try again later");
}

class GetCountry {
  String code = "";

  String getCode() {
    if (code == null || code == "") return "Belgium%BE";
    else return code;
  }
  void setCode(String code) {
    this.code = code;
  }
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScreenAppBar(getTranslated(context, 'statistics')),
        body: Column(children: <Widget>[
          CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(getTranslated(context, 'choose_country')), // needed by zoeken van een land // todo translate
            ),
            initialSelection: 'Belgium%BE', // todo met %BE?
            onChanged: (String code) {
              setState(() {
                widget.getCountry.setCode(code); // todo code in country aanpassen
                fetchPost(widget.getCountry.getCode()); // todo updaten nu na onChanged, met de nieuwe code van country
                build(context); /// zichzelf builden
              });
            },
          ),
          Center(child: FutureBuilder<CoronaStatistics>(
            future: fetchPost(widget.getCountry.getCode()),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text("Country: " + widget.getCountry.getCode().split("%")[1] + "\n" + getTranslated(context, 'confirmed') +
                    snapshot.data.confirmedcases.toString() +
                    'deaths' +
                    snapshot.data.deathcases.toString() +
                    'recovered' +
                    snapshot.data.recovered.toString());
              else if (snapshot.hasError) print("snapshot has error: " + snapshot.error.toString()); // todo wegdoen
              return CircularProgressIndicator();
            },
          )),
        ],)
    );
  }
}
