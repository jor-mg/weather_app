import 'package:flutter/material.dart';
import 'package:weather_app/local_storage/local_storage.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  final ThemeData _themeDataLight = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xFFF6F9FF),
  );

  final ThemeData _themeDataDark = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff892CDC),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  ThemeData _themeData = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xFFF6F9FF),
  );

  bool get isDark => _isDark;

  ThemeProvider() {
    getThemeAtInit();
  }

  getThemeAtInit() {
    final bool isDarkTheme = LocalStorage.isDark;
    if (isDarkTheme) {
      _themeData = _themeDataDark;
    } else {
      _themeData = _themeDataLight;
    }
    notifyListeners();
  }

  ThemeData getTheme() => _themeData;

  void toggleTheme() {
    LocalStorage.isDark = !LocalStorage.isDark;
    _isDark = !_isDark;
    _themeData = _themeData.brightness == Brightness.dark
        ? _themeDataLight
        : _themeDataDark;
    notifyListeners();
  }
}
