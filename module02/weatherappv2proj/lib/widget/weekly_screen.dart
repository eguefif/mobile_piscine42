import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';
import 'package:weatherappv2proj/widget/none_data_body.dart';
import 'package:weatherappv2proj/widget/error_body.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key, required this.data}) : title = "Weekly";

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
                          Text("${data.week["description"][index].description}"),
                        ])),
          )
        ],
      ),
    );
  }
}
