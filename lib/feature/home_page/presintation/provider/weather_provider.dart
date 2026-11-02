import 'package:flutter/material.dart';
import 'package:weather_app/feature/home_page/data/model/weather_model.dart';
import 'package:weather_app/feature/home_page/data/repository/weather_repository_impl.dart';

enum AppState { initial, load, succes, error }

class WeatherProvider extends ChangeNotifier {
  String errorMessage = '';
  AppState appState = AppState.initial;
  WeatherModel? weather;
  WeatherRepositoryImpl repository = WeatherRepositoryImpl();

  WeatherProvider() {
    getWeather('Amman');
  }

  Future<void> getWeather(String city) async {
    appState = AppState.load;
    notifyListeners();

    try {
      weather = await repository.getWeather(city: city);
      appState = AppState.succes;
    } catch (e) {
      errorMessage = e.toString();
      appState = AppState.error;
    }

    notifyListeners();
  }
}