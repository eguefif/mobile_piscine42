import 'package:flutter/material.dart';
import 'package:module03/models/weather_data.dart';
import 'package:module03/widget/loading_Screen.dart';
import 'package:module03/widget/error_body.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.data}) : title = "Today";

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
                  Text("${data.today["description"][index]}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
