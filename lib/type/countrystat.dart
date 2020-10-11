class CountryStat {
  final String _confirmedcases;
  final String _deathcases;
  final String _recovered;

  CountryStat(this._confirmedcases, this._deathcases, this._recovered);

  factory CountryStat.fromJson(Map<String, dynamic> json) {
    return CountryStat(
      json['confirmed'].toString(),
      json['deaths'].toString(),
      json['recovered'].toString(),
    );
  }

  String getConfirmedCases() => _confirmedcases;

  String getDeathCases() => _deathcases;

  String getRecovered() => _recovered;
}
