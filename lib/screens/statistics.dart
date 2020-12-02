import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/service/statisticsservice.dart';
import 'package:coronapp/type/country.dart';
import 'package:coronapp/type/countrystat.dart';
import 'package:coronapp/widgets/screenappbar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Country _selectedCountry;
  StatisticsService _service;
  List<Country> _countries = [
    new Country("World", "Planet Earth", "🌎"),
    new Country("Belgium", "Belgium", "🇧🇪"),
    new Country("Netherlands", "Netherlands", "🇳🇱"),
    new Country("UK", "United Kingdom", "🇬🇧"),
    new Country("Luxembourg", "Luxembourg", "🇱🇺"),
    new Country("France", "France", "🇫🇷"),
    new Country("Germany", "Germany", "🇩🇪"),
    new Country("Spain", "Spain", "🇪🇸"),
    new Country("USA", "United States", "🇺🇸"),
    new Country("China", "China", "🇨🇳"),
    new Country("Bosnia and Herzegovina", "Bosnia and Herzegovina", "🇧🇦"),
  ];

  _StatisticsScreenState() {
    this._service = new StatisticsService();
    if (_selectedCountry == null)
      this._selectedCountry = _countries.elementAt(0);
  }

  // Show the statistics of the world
  Widget _showStatsOfTheEarth(CountryStat stats) {
    Map<String, double> _data = new Map();
    _data.addAll({
      getTranslated(context, "confirmed"): stats.getCases().toDouble(),
      getTranslated(context, "recovered"): stats.getRecovered().toDouble(),
      getTranslated(context, "deaths"): stats.getDeaths().toDouble(),
    });

    List<Color> _colors = [
      Colors.green,
      Colors.blueAccent,
      Colors.red,
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    getTranslated(context, "cases") + ": " + stats.getCases().toString(),
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  Text(
                    getTranslated(context, "deaths") + ": " + stats.getDeaths().toString(),
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                  Text(
                    getTranslated(context,  "recovered") + ": " + stats.getRecovered().toString(),
                    style: TextStyle(
                      fontSize: 19.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              PieChart(
                dataMap: _data,
                colorList: _colors,
                animationDuration: Duration(milliseconds: 1500),
                chartLegendSpacing: 32.0,
                chartRadius: MediaQuery.of(context).size.width / 2.7,
                showChartValuesInPercentage: false,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.grey[200],
                showLegends: true,
                legendPosition: LegendPosition.left,
                decimalPlaces: 0,
                showChartValueLabel: true,
                initialAngle: 0,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
                ),
                chartType: ChartType.disc,
              ),
            ],
          )
        ],
      ),
    );
  }

  // Show the statistics of a country
  Widget _showStatsOfCountry(CountryStat stats) {
    Map<String, double> _data = new Map();
    _data.addAll({
      getTranslated(context,  "cases"): stats.getCases().toDouble(),
      getTranslated(context,  "deaths"): stats.getDeaths().toDouble(),
    });

    List<Color> _colors = [
      Colors.red,
      Colors.teal,
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  (() {
                    if (stats.getCases() != 0) {
                      return new Text(
                          getTranslated(context, "cases") + ": " + stats.getCases().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "nocase"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getDeaths() != 0) {
                      return new Text(
                          getTranslated(context, "deaths") + ": " + stats.getDeaths().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "nodeaths"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getRecovered() != 0) {
                      return new Text(
                          getTranslated(context, "recovered") + ": " + stats.getRecovered().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "norecover"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getActive() != 0) {
                      return new Text(
                          getTranslated(context, "active") + stats.getActive().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "noactive"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getCritical() != 0) {
                      return new Text(
                          getTranslated(context, "critical") + stats.getCritical().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "nocritic"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getTodayCases() != 0) {
                      return new Text(
                          getTranslated(context, "todaycase") + stats.getTodayCases().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                        getTranslated(context, "notodaycase"),
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getTodayDeaths() != 0) {
                      return new Text(
                          getTranslated(context, "todaydeath") + stats.getTodayDeaths().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                        getTranslated(context, "nottodaydeath"),
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getCasesPerOneMillion() != 0) {
                      return new Text(
                          getTranslated(context, "casemill") +
                            stats.getCasesPerOneMillion().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "nocasemill"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getDeathsPerOneMillion() != 0) {
                      return new Text(
                          getTranslated(context, "deathmill") +
                            stats.getDeathsPerOneMillion().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                        getTranslated(context, "nodeathmill"),
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      );
                    }
                  }()),
                  (() {
                    if (stats.getTests() != 0) {
                      return new Text(
                          getTranslated(context, "tests") + stats.getTests().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "notests"));
                    }
                  }()),
                  (() {
                    if (stats.getTestsPerOneMillion() != 0) {
                      return new Text(
                          getTranslated(context, "testmill") +
                            stats.getTestsPerOneMillion().toString(),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    } else {
                      return new Text(
                          getTranslated(context, "notestmill"),
                          style: TextStyle(
                            fontSize: 19.0,
                          ),
                      );
                    }
                  }()),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PieChart(
                    dataMap: _data,
                    colorList: _colors,
                    animationDuration: Duration(milliseconds: 1500),
                    chartLegendSpacing: 32.0,
                    chartRadius: MediaQuery.of(context).size.width / 2.7,
                    showChartValuesInPercentage: false,
                    showChartValues: true,
                    showChartValuesOutside: true,
                    chartValueBackgroundColor: Colors.grey[200],
                    showLegends: true,
                    legendPosition: LegendPosition.left,
                    decimalPlaces: 1,
                    showChartValueLabel: true,
                    initialAngle: 0,
                    chartValueStyle: defaultChartValueStyle.copyWith(
                      color: Colors.blueGrey[900].withOpacity(0.9),
                    ),
                    chartType: ChartType.disc,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Show that the API is offline
  Widget _showApiOffline() {
    return Container(
      child: Text(getTranslated(context, "apioff")),
    );
  }

  // Show that something went wrong
  Widget _showSomethingWentWrong(String error) {
    print(getTranslated(context, "wrong") + error);
    return Container(
      child: Text(getTranslated(context, "wrong") + "(" + error),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'statistics')),
      body: SingleChildScrollView( child: Column(
        children: [
          // COUNTRY SELECTION
          Center(
            heightFactor: 2,
            child: DropdownButton(
              value: _selectedCountry,
              items: _countries.map((Country country) {
                return new DropdownMenuItem(
                  child: new Text(
                    country.getBeautifulName(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  value: country,
                );
              }).toList(),
              onChanged: (Country newcountry) {
                setState(() {
                  _selectedCountry = newcountry;
                });
              },
            ),
          ),
          // INFORMATION of COUNTRY
          FutureBuilder<CountryStat>(
            future: _service.getData(_selectedCountry.getCode()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Getting data from API is done
                CountryStat stats = snapshot.data;
                if (stats.getCountry() == "API_OFFLINE")
                  // API is offline
                  return _showApiOffline();
                else {
                  // API is online and working great
                  if (stats.getCountry() == "World") {
                    // Show world stats
                    return _showStatsOfTheEarth(stats);
                  } else {
                    // Show country stats
                    return _showStatsOfCountry(stats);
                  }
                }
              } else if (snapshot.hasError) {
                // Internal error
                return _showSomethingWentWrong(snapshot.error.toString());
              }
              // Still loading
              return CircularProgressIndicator();
            },
          ),
        ],
      ),)
    );
  }
}
