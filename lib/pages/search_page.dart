// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/models/weather_model.dart';
import 'package:weather_flutter_app/providers/weather_provider.dart';
import 'package:weather_flutter_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.updateUI});

  String? cityName;

  VoidCallback? updateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) async {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService weatherService = WeatherService();
              WeatherModel? weatherModel =
                  await weatherService.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weatherModel;

              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 35,
                horizontal: 20,
              ),
              label: const Text(
                'Search',
              ),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService weatherService = WeatherService();
                  WeatherModel? weatherModel =
                      await weatherService.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weatherModel;

                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                child: const Icon(Icons.search),
              ),
              hintText: 'Enter a City',
              labelStyle: const TextStyle(fontSize: 23),
              hintStyle: const TextStyle(fontSize: 20),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
