import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coronapp/type/country.dart';
import 'package:coronapp/type/countrystat.dart';

class StatisticsService {
  Future<CountryStat> getData(String countrycode) async {
    final url = "https://covid19-stats-api.herokuapp.com/api/v1/cases?country=";
    final response = await http.get(url + countrycode);
    switch (response.statusCode) {
      case 200:
        return CountryStat.fromJson(json.decode(response.body));
        break;
      default:
        return CountryStat("?", "?", "?");
        break;
    }
  }

  List<Country> getCountries() => [
        new Country("Belgium", "Belgium", "🇧🇪"),
        new Country("Netherlands", "Netherlands", "🇳🇱"),
        new Country("United Kingdom", "United Kingdom", "🇬🇧"),
        new Country("Luxembourg", "Luxembourg", "🇱🇺"),
        new Country("France", "France", "🇫🇷"),
        new Country("Germany", "Germany", "🇩🇪"),
        new Country("US", "United States", "🇺🇸"),
        new Country("China", "China", "🇨🇳"),
      ];
}
