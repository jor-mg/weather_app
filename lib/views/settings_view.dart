import 'package:flutter/material.dart';
//
import 'package:provider/provider.dart';
import 'package:weather_app/config/theme.dart';
//
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/local_storage/local_storage.dart';
import 'package:weather_app/views/widgets/custom_appbar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastController = context.watch<ForecastController>();
    final themeProvider = context.watch<ThemeProvider>();
    final selectedCity = forecastController.selectedCity;

    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Settings'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Change location',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          RadioListTile(
            value: 'Chimbote',
            groupValue: selectedCity,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (val) => forecastController.changeSelectedCity(val!),
            title: const Text('Chimbote'),
          ),
          RadioListTile(
            value: 'London',
            groupValue: selectedCity,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (val) => forecastController.changeSelectedCity(val!),
            title: const Text('London'),
          ),
          RadioListTile(
            value: 'Washington',
            groupValue: selectedCity,
            controlAffinity: ListTileControlAffinity.trailing,
            onChanged: (val) => forecastController.changeSelectedCity(val!),
            title: const Text('Washington'),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Preferences',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
          SwitchListTile(
            value: LocalStorage.isDark,
            onChanged: (val) {
              themeProvider.toggleTheme();
            },
            title: const Text('Dark mode'),
          )
        ],
      ),
    );
  }
}
