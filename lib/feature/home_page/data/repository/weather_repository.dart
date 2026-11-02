import 'package:weather_app/feature/home_page/data/model/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(String city);
}