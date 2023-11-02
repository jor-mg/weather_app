// To parse this JSON data, do
//
//     final forecast = forecastFromJson(jsonString);

import 'dart:convert';

import 'package:weather_app/models/models.dart';

WeatherModel forecastFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String forecastToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherLocation? location;
  CurrentWeather? current;
  DailyForecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: WeatherLocation.fromJson(json["location"]),
        current: CurrentWeather.fromJson(json["current"]),
        forecast: DailyForecast.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location!.toJson(),
        "current": current!.toJson(),
        "forecast": forecast!.toJson(),
      };
}
