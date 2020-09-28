class CoronaStatistics {
  final int confirmedcases;
  final int deathcases;
  final int recovered;

  CoronaStatistics({this.confirmedcases, this.deathcases, this.recovered});

  factory CoronaStatistics.fromJson(Map<String, dynamic> json){
    return CoronaStatistics(
    confirmedcases: json['confirmed'],
    deathcases: json['deaths'],
    recovered: json['recovered'],
    );
  }
}