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
  List<Country> _countries;

  _StatisticsScreenState() {
    this._service = new StatisticsService();
    this._countries = this._service.getCountries();
    if (_selectedCountry == null)
      this._selectedCountry = _countries.elementAt(0);
  }

  Widget _showStats(CountryStat stats) {
    final double _height = 110;
    final double _width = 110;

    final BoxDecoration _decoration = BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    final TextStyle _styleTitle = TextStyle(
      color: Colors.white,
      fontSize: 20.3,
    );

    final TextStyle _styleNumber = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 23.0,
    );

    double total = (double.parse(stats.getConfirmedCases()) / 2) +
        (double.parse(stats.getDeathCases()) / 2) +
        double.parse(stats.getRecovered());
    Map<String, double> data = new Map();
    data.addAll({
      getTranslated(context, 'confirmed'):
          (double.parse(stats.getConfirmedCases()) / total) *
              50, // maal 50 om te delen door 2
      getTranslated(context, 'deaths'):
          (double.parse(stats.getDeathCases()) / total) * 50,
      getTranslated(context, 'recovered'):
          (double.parse(stats.getRecovered()) / total) * 100,
    });

    List<Color> _colors = [
      Colors.red,
      Colors.blueAccent,
      Colors.amberAccent,
      Colors.teal
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Confirmed cases
            Container(
              height: _height,
              width: _width,
              decoration: _decoration,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getTranslated(context, 'confirmed'),
                      style: _styleTitle,
                    ),
                    Text(
                      stats.getConfirmedCases(),
                      style: _styleNumber,
                    ),
                  ],
                ),
              ),
            ),
            // Death Cases
            Container(
              height: _height,
              width: _width,
              decoration: _decoration,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getTranslated(context, 'deaths'),
                      style: _styleTitle,
                    ),
                    Text(
                      stats.getDeathCases(),
                      style: _styleNumber,
                    ),
                  ],
                ),
              ),
            ),
            // Recovered cases
            Container(
              height: _height,
              width: _width,
              decoration: _decoration,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getTranslated(context, 'recovered'),
                      style: _styleTitle,
                    ),
                    Text(
                      stats.getRecovered(),
                      style: _styleNumber,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PieChart(
                  dataMap: data,
                  colorList: _colors,
                  animationDuration: Duration(milliseconds: 1500),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  showChartValuesOutside: true,
                  chartValueBackgroundColor: Colors.grey[200],
                  showLegends: true,
                  legendPosition: LegendPosition.right,
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
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(getTranslated(context, 'statistics')),
      body: Column(
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
                // ignore: unnecessary_cast
                return _showStats(snapshot.data as CountryStat);
              } else if (snapshot.hasError) {
                return Text("Snapshot error");
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
