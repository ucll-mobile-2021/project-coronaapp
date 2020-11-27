import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:coronapp/type/countrystat.dart';

class StatisticsService {
  Future<CountryStat> getData(String countrycode) async {
    final url = "https://coronavirus-19-api.herokuapp.com/countries/";
    final response = await http.get(url + countrycode);
    switch (response.statusCode) {
      case 200:
        return CountryStat.fromJson(json.decode(response.body));
        break;
      default:
        return CountryStat("API_OFFLINE", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        break;
    }
  }
}
