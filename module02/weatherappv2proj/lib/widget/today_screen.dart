import 'package:flutter/material.dart';
import 'package:weatherappv2proj/models/weather_data.dart';
import 'package:weatherappv2proj/widget/none_data_body.dart';
import 'package:weatherappv2proj/widget/error_body.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key, required this.data}) : title = "Today";

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
                  Text("${data.today["description"][index].description}"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
