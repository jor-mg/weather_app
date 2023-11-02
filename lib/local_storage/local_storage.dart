import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static String _city = 'Chimbote';

  static Future<void> initializePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get city {
    return _prefs.getString('city') ?? _city;
  }

  static set city(String city) {
    _city = city;
    _prefs.setString('city', city);
  }
}
