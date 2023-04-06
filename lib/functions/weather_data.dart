import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherData {
  Future<Weather> getData(var name) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=f3471f11b19b4f128e843313230604&q=$name&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
