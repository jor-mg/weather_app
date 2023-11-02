import 'forecast_day_model.dart';

class DailyForecast {
  List<Forecastday> forecastday;

  DailyForecast({
    required this.forecastday,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        forecastday: List<Forecastday>.from(
            json["forecastday"].map((x) => Forecastday.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
      };
}
