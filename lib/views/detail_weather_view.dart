import 'package:flutter/material.dart';
//
import 'package:card_swiper/card_swiper.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//
import 'package:weather_app/models/models.dart' as model;
import 'package:weather_app/controllers/forecast_controller.dart';
import 'package:weather_app/views/widgets/widgets.dart';

class DetailWeatherView extends StatelessWidget {
  final List<model.Forecastday> listForecastDay;
  final int index;
  final String? city;

  const DetailWeatherView({
    super.key,
    required this.listForecastDay,
    required this.index,
    this.city = 'Sin ciudad',
  });

  @override
  Widget build(BuildContext context) {
    final forecastController = context.watch<ForecastController>();

    return Scaffold(
      //backgroundColor: const Color(0xFFF6F9FF),
      appBar: CustomAppBarWidget(title: 'Details of $city'),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Swiper(
            itemCount: listForecastDay.length,
            pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 200),
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff892CDC)
                    : Colors.blue,
              ),
            ),
            index: index,
            itemBuilder: (_, index) {
              final forecastDay = listForecastDay[index];
              final dayOfWeek =
                  forecastController.getDayOfWeekFromDate(forecastDay.date);
              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              final String formatted = formatter.format(forecastDay.date);

              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      dayOfWeek,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      formatted,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      forecastDay.day.condition.text,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.network('https:${forecastDay.day.condition.icon}'),
                    const SizedBox(height: 20),
                    Text(
                      '${forecastDay.day.mintempC}º/${forecastDay.day.maxtempC}º',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardInfoWidget(
                          title: 'Humedity',
                          value: '${forecastDay.day.avghumidity}%',
                          pathIcon: 'assets/icons/humidity_icon.png',
                        ),
                        CardInfoWidget(
                          title: 'Windspeed',
                          value: '${forecastDay.day.maxwindMph}mph',
                          pathIcon: 'assets/icons/wind_icon.png',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
