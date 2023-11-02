import 'dart:convert';
//
import 'package:flutter/material.dart';
//
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/local_storage/local_storage.dart';
//
import 'package:weather_app/models/models.dart';

class ForecastController extends ChangeNotifier {
  List<WeatherModel> forecastss = [];
  String _selectedCity = LocalStorage.city;
  WeatherModel _weatherModel = WeatherModel();

  bool _isLoading = false;

  String get selectedCity => _selectedCity;
  WeatherModel get weatherModel => _weatherModel;
  bool get isLoading => _isLoading;

  ForecastController() {
    loadWeathers(city: LocalStorage.city);
  }

  Future<void> loadWeathers({required String city}) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.http('api.weatherapi.com', '/v1/forecast.json', {
      'key': '9fc460dc74ba4a129e6184132230111',
      'q': city,
      'days': '7',
    });

    final response = await http.get(url);

    final jsonData = json.decode(response.body);
    final weatherModelR = forecastFromJson(json.encode(jsonData));
    //forecastss.add(forecastR);
    _weatherModel = weatherModelR;
    _isLoading = false;
    notifyListeners();

    print(response.body);
  }

  changeSelectedCity(String city) {
    if (_selectedCity == city) return;

    _selectedCity = city;
    LocalStorage.city = city;
    loadWeathers(city: city);
    notifyListeners();
  }

  String getDayOfWeekFromDate(DateTime date) {
    final formatter = DateFormat('EEEE');
    final dayOfWeek = formatter.format(date);
    return dayOfWeek;
  }
}
