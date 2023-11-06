import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/theme.dart';
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/local_storage/local_storage.dart';
import 'package:weather_app/views/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.initializePrefs();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ForecastController(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WEATHERAPP',
      theme: themeProvider.getTheme(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      //   brightness: Brightness.light,
      // ),
      // theme: ThemeData.light(
      //   useMaterial3: true,
      // ).copyWith(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.blue,
      //     titleTextStyle: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //     iconTheme: IconThemeData(color: Colors.white),
      //   ),
      //   scaffoldBackgroundColor: const Color(0xFFF6F9FF),
      // ),
      // theme: ThemeData.dark(
      //   useMaterial3: true,
      // ).copyWith(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xff892CDC),
      //     titleTextStyle: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //     iconTheme: IconThemeData(color: Colors.white),
      //   ),
      // ),
      home: const HomeView(),
    );
  }
}
