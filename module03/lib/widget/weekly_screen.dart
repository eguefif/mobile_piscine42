import 'package:flutter/material.dart';
import 'package:module03/models/weather_data.dart';
import 'package:module03/widget/loading_Screen.dart';
import 'package:module03/widget/error_body.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key, required this.data}) : title = "Weekly";

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
          Text(title, style: Theme.of(context).textTheme.titleLarge),
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
