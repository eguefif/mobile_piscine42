import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.data});

  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    if (data.location["city"] == "None") {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Today", style: Theme.of(context).textTheme.titleLarge),
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
                itemCount: data.today["hours"].length,
                itemBuilder: (ctx, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${data.today["hours"][index]}:00"),
                          Text("${data.today["temperature"][index]} C"),
                          Text("${data.today["speed"][index]}km/h"),
                        ])),
          )
        ],
      ),
    );
  }
}
