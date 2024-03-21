import 'package:flutter/material.dart';
import 'package:module03/models/weather_data.dart';
import 'package:module03/widget/loading_Screen.dart';
import 'package:module03/widget/error_body.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key, required this.data}) : title = "Today";

  final WeatherData data;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (isNoData(data)) {
      return const LoadingScreen();
    }
    if (data.error["error"]) {
      return ErrorBody(data: data, title: title);
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("${data.location["city"]}",
                  style: Theme.of(context).textTheme.titleMedium),
              Text("${data.location["state"]}, ${data.location["country"]}",
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          Text("${data.currentConditions["temp"]} \u2103",
              style: Theme.of(context).textTheme.titleLarge),
          Column(
            children: [
              Text("${data.currentConditions["description"].description}",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              data.currentConditions["description"].getIcon(),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(size: 55, getWindIcon(data.currentConditions["speed"])),
                const SizedBox(width: 15),
                Text("${data.currentConditions["speed"]} km/h",
                    style: Theme.of(context).textTheme.bodyMedium),
              ]),
        ],
      ),
    );
  }
}

IconData getWindIcon(double speed) {
  if (speed == 0) return WeatherIcons.wind_beaufort_0;
  if (speed > 0 && speed <= 5) return WeatherIcons.wind_beaufort_1;
  if (speed > 6 && speed <= 11) return WeatherIcons.wind_beaufort_2;
  if (speed > 12 && speed <= 19) return WeatherIcons.wind_beaufort_3;
  if (speed > 20 && speed <= 28) return WeatherIcons.wind_beaufort_4;
  if (speed > 29 && speed <= 38) return WeatherIcons.wind_beaufort_5;
  if (speed > 38 && speed <= 49) return WeatherIcons.wind_beaufort_6;
  if (speed > 50 && speed <= 61) return WeatherIcons.wind_beaufort_7;
  if (speed > 62 && speed <= 74) return WeatherIcons.wind_beaufort_8;
  if (speed > 75 && speed <= 88) return WeatherIcons.wind_beaufort_9;
  if (speed > 89 && speed <= 102) return WeatherIcons.wind_beaufort_10;
  if (speed > 103 && speed <= 117) return WeatherIcons.wind_beaufort_11;
  if (speed > 118) return WeatherIcons.wind_beaufort_12;
  return WeatherIcons.wind_beaufort_0;
}
