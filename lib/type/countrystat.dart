class CountryStat {
  final String _country;
  final int _cases;
  final int _todayCases;
  final int _deaths;
  final int _todayDeaths;
  final int _recovered;
  final int _active;
  final int _critical;
  final int _casesPerOneMillion;
  final int _deathsPerOneMillion;
  final int _totalTests;
  final int _testsPerOneMillion;

  CountryStat(
    this._country,
    this._cases,
    this._todayCases,
    this._deaths,
    this._todayDeaths,
    this._recovered,
    this._active,
    this._critical,
    this._casesPerOneMillion,
    this._deathsPerOneMillion,
    this._totalTests,
    this._testsPerOneMillion,
  );

  factory CountryStat.fromJson(Map<String, dynamic> json) {
    int _whenNullGiveNullAsNumber(String parameter) {
      if (parameter == "null")
        return 0;
      else
        return int.parse(parameter);
    }

    return CountryStat(
      json['country'].toString(),
      _whenNullGiveNullAsNumber(json['cases'].toString()),
      _whenNullGiveNullAsNumber(json['todayCases'].toString()),
      _whenNullGiveNullAsNumber(json['deaths'].toString()),
      _whenNullGiveNullAsNumber(json['todayDeaths'].toString()),
      _whenNullGiveNullAsNumber(json['recovered'].toString()),
      _whenNullGiveNullAsNumber(json['active'].toString()),
      _whenNullGiveNullAsNumber(json['critical'].toString()),
      _whenNullGiveNullAsNumber(json['casesPerOneMillion'].toString()),
      _whenNullGiveNullAsNumber(json['deathsPerOneMillion'].toString()),
      _whenNullGiveNullAsNumber(json['totalTests'].toString()),
      _whenNullGiveNullAsNumber(json['testsPerOneMillion'].toString()),
    );
  }

  String getCountry() => _country;
  int getCases() => _cases;
  int getTodayCases() => _todayCases;
  int getDeaths() => _deaths;
  int getTodayDeaths() => _todayDeaths;
  int getRecovered() => _recovered;
  int getActive() => _active;
  int getCritical() => _critical;
  int getCasesPerOneMillion() => _casesPerOneMillion;
  int getDeathsPerOneMillion() => _deathsPerOneMillion;
  int getTests() => _totalTests;
  int getTestsPerOneMillion() => _testsPerOneMillion;
}
