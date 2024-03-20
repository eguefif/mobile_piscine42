import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';
import 'package:weatherappv2proj/widget/none_data_body.dart';
import 'package:weatherappv2proj/widget/error_body.dart';

class CurrentScreen extends StatelessWidget {
  const CurrentScreen({super.key, required this.data}) : title = "Today";

  final WeatherData data;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (isNoData(data)) {
      return NoneDataBody(title: title);
    }
    if (data.error["error"]) {
      return ErrorBody(data: data, title: title);
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
