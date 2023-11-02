import 'package:flutter/material.dart';
//
import 'package:provider/provider.dart';
//
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/views/widgets/custom_appbar_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final forecastController = context.watch<ForecastController>();
    final selectedCity = forecastController.selectedCity;

    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Settings'),
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
