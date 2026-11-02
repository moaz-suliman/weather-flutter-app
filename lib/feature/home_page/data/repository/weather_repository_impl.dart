import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/feature/home_page/data/model/weather_model.dart';

class WeatherRepositoryImpl {
  Future<WeatherModel> getWeather({String city = "Amman"}) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=45e53612ab6f961b4eb910785c826c9c&units=metric';
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final result = WeatherModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      debugPrint(' ${response.statusCode}');
      debugPrint('${response.body}');
      throw Exception('failed to get data : ${response.statusCode}');
    }
  }
}