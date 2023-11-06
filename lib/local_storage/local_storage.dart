import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static String _city = 'Chimbote';

  //Dark mode
  static bool _isDark = false;

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

  //Dark mode
  static bool get isDark {
    return _prefs.getBool('isDark') ?? _isDark;
  }

  static set isDark(bool isDark) {
    _isDark = isDark;
    _prefs.setBool('isDark', isDark);
  }
}
