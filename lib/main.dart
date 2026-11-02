import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/home_page/presintation/provider/weather_provider.dart';
import 'package:weather_app/feature/home_page/presintation/view/home_page_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageView(),
      ),
    ),
  );
}
