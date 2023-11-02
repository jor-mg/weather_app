import 'package:flutter/material.dart';
//
import 'package:provider/provider.dart';
//
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/views/views.dart';
import 'package:weather_app/views/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final sWidth = size.width;
    final sHeight = size.height;

    final forecastController = context.watch<ForecastController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F9FF),
      appBar: CustomAppBarWidget(
        title: 'WEATHER APP',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SettingsView(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: forecastController.isLoading
            ? const _LoadingWidget()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    forecastController.weatherModel.location!.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    forecastController.weatherModel.location!.country,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const Text('7 day forecast'),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.separated(
                      itemCount: forecastController
                          .weatherModel.forecast!.forecastday.length,
                      padding: const EdgeInsets.only(bottom: 20),
                      itemBuilder: (_, index) {
                        final weather = forecastController
                            .weatherModel.forecast!.forecastday[index];

                        final dayOfWeek = forecastController
                            .getDayOfWeekFromDate(weather.date);

                        if (index == 0) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailWeatherView(
                                    listForecastDay: forecastController
                                        .weatherModel.forecast!.forecastday,
                                    index: index,
                                    city: forecastController
                                        .weatherModel.location!.name,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              //height: sHeight * 0.15,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(31, 194, 194, 194),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'TODAY',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            dayOfWeek,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            weather.day.condition.text,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                              '${weather.day.mintempC}º/${weather.day.maxtempC}º'),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Image.network(
                                          'https:${weather.day.condition.icon}'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: CardInfoWidget(
                                          title: 'Humidity',
                                          value: '${weather.day.avghumidity}%',
                                          pathIcon:
                                              'assets/icons/humidity_icon.png',
                                          isVertical:
                                              false, //La tarjeta es horizontal
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: CardInfoWidget(
                                          title: 'Windspeed',
                                          value: '${weather.day.maxwindMph}mph',
                                          pathIcon:
                                              'assets/icons/wind_icon.png',
                                          isVertical:
                                              false, //La tarjeta es horizontal
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailWeatherView(
                                  listForecastDay: forecastController
                                      .weatherModel.forecast!.forecastday,
                                  index: index,
                                  city: forecastController
                                      .weatherModel.location!.name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: sHeight * 0.10,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(31, 194, 194, 194),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Text(
                                  dayOfWeek,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blue,
                                  ),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      weather.day.condition.text,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                        '${weather.day.mintempC}º/${weather.day.maxtempC}º'),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Image.network(
                                    'https:${weather.day.condition.icon}'),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.blue),
    );
  }
}
