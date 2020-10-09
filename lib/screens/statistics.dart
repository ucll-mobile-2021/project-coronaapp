import 'dart:convert';
import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/type/coronastatistics.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:country_list_pick/country_list_pick.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();

  final GetCountry getCountry = GetCountry();
}

Future<CoronaStatistics> fetchPost(String code) async {
  if (code == null) throw Exception("Code is null"); //todo
  if (code == "")
    code =
        "BE.Belgium.+32"; // todo eerste call (in _statisticsScreenState) met lege parameter
  final response = await http.get(
      "https://covid19-stats-api.herokuapp.com/api/v1/cases?country=" +
          code.split(".")[1]); //" + country); // TODO select land

  if (response.statusCode == 200)
    return CoronaStatistics.fromJson(json.decode(response.body));
  //else return CoronaStatistics.fromJson(json.decode('{"confirmed":"???","deaths":"???","recovered":"???"}')); //throw Exception("Failed to load the post, try again later"); // TODO TRANSLATE
  else
    return CoronaStatistics.fromJson(json.decode(
        '{"confirmed":"Info","deaths":"Not","recovered":"Found"}')); //throw Exception("Failed to load the post, try again later");
}

class GetCountry {
  String code = "";

  String getCode() {
    if (code == null || code == "")
      return "BE.Belgium.+32";
    else
      return code;
  }

  void setCode(String code) {
    this.code = code;
  }
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'statistics')),
      body: Column(
        children: <Widget>[
          CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text(getTranslated(context,
                  'choose_country')), // needed by zoeken van een land // todo translate
            ),
            initialSelection: widget.getCountry.getCode() == null ||
                    widget.getCountry.getCode() == ""
                ? '+32'
                : widget.getCountry.getCode().split('.')[2],
            onChanged: (CountryCode code) {
              setState(() {
                String newCode =
                    code.code + "." + code.name + "." + code.dialCode;
                widget.getCountry
                    .setCode(newCode); // todo code in country aanpassen
                fetchPost(widget.getCountry
                    .getCode()); // todo updaten nu na onChanged, met de nieuwe code van country
                build(context);

                /// zichzelf builden
              });
            },
          ),
          Center(
              child: FutureBuilder<CoronaStatistics>(
            future: fetchPost(widget.getCountry.getCode()),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Text("Country: " +
                    widget.getCountry.getCode().split(".")[1] +
                    "\n" +
                    getTranslated(context, 'confirmed') +
                    snapshot.data.confirmedcases.toString() +
                    getTranslated(context, 'deaths') +
                    snapshot.data.deathcases.toString() +
                    getTranslated(context, 'recovered') +
                    snapshot.data.recovered.toString());
              else if (snapshot.hasError) print("snapshot has error");
              return CircularProgressIndicator();
            },
          )),
        ],
      ),
    );
  }
}
