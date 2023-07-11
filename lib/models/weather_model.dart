//el class ely hast2bel feh el bayanat bta3y
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherStateName;

//use constructor to create instance of that class
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName});
//factory constructor help me in return object have all data from json
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
        date:  data['location']['localtime'],
        temp: jsonData['day']['avgtemp_c'],
        minTemp: jsonData['day']['mintemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        weatherStateName: jsonData['hour'][0]['condition']['text']);
  }

//to print weathermodel
  @override
  String toString() {
    return 'temp = $temp , mintemp = $minTemp , maxtemp = $maxTemp , date = $date  , state = $weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Moderate') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Overcast') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Light rain shower' ||
        weatherStateName == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud' ||
        weatherStateName == 'Moderate') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName == 'Partly cloudy' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Overcast') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Light rain shower' ||
        weatherStateName == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder') {
      return Colors.purple;
    } else {
      return Colors.orange;
    }
  }
}
