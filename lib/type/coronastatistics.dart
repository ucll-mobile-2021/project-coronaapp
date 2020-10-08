class CoronaStatistics {
  final String confirmedcases;
  final String deathcases;
  final String recovered;

  CoronaStatistics({this.confirmedcases, this.deathcases, this.recovered});

  factory CoronaStatistics.fromJson(Map<String, dynamic> json){
    return CoronaStatistics(
      confirmedcases: json['confirmed'].toString(),
      deathcases: json['deaths'].toString(),
      recovered: json['recovered'].toString(),
    );
  }
}