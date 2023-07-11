// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_flutter_app/models/weather_model.dart'; //for memorized the methods that used inside this file http.dart

class WeatherService {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = '77c63a278da0448583692927231007';

      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=30');

//Class Response                      //get method
      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }

    return weatherModel;
  }
}
