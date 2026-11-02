class WeatherModel {
  final String city;
  final String description;
  final String icon;
  final double temp;
  final double high;
  final double low;

  WeatherModel({
    required this.city,
    required this.description,
    required this.icon,
    required this.temp,
    required this.high,
    required this.low,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      temp: (json['main']['temp']).toDouble(),
      high: (json['main']['temp_max']).toDouble(),
      low: (json['main']['temp_min']).toDouble(),
    );
  }
}