import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key, required this.data});

  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    if (data.location["city"] == "None") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Weekly", style: Theme.of(context).textTheme.titleLarge),
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
          Text("Today", style: Theme.of(context).textTheme.titleLarge),
          Text("${data.location["city"]}"),
          Text("${data.location["state"]}"),
          Text("${data.location["country"]}"),
          Expanded(
            child: ListView.builder(
                itemCount: data.week["date"].length,
                itemBuilder: (ctx, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${data.week["date"][index]}"),
                          Text("${data.week["maxs"][index]} C"),
                          Text("${data.week["mins"][index]} C"),
                          Text("${data.week["description"][index]}"),
                        ])),
          )
        ],
      ),
    );
  }
}
