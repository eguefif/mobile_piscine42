import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key, required this.data});

  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    if (data.location["city"] == "None") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Currently", style: Theme.of(context).textTheme.titleLarge),
            const Text("Fetching data"),
          ],
        ),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Currently", style: Theme.of(context).textTheme.titleLarge),
          Text("${data.location["city"]}"),
          Text("${data.location["state"]}"),
          Text("${data.location["country"]}"),
          Text("${data.currentConditions["temp"]} C"),
          Text("${data.currentConditions["description"]}"),
          Text("${data.currentConditions["speed"]} km/h"),
        ],
      ),
    );
  }
}
