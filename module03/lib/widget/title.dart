import 'package:module03/models/weather_data.dart';

import 'package:flutter/material.dart';

class TitleBody extends StatelessWidget {
  const TitleBody({super.key, required this.data});

  final WeatherData data;

  @override
  Widget build(BuildContext context){
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${data.location["city"]}",
                    style: Theme.of(context).textTheme.titleMedium),
                Text("${data.location["state"]}, ${data.location["country"]}",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
    );
  }
}

class TitleBodyRow extends StatelessWidget {
  const TitleBodyRow({super.key, required this.data});

  final WeatherData data;

  @override
  Widget build(BuildContext context){
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${data.location["city"]}",
                    style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(width: 25),
                Text("${data.location["state"]}, ${data.location["country"]}",
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
    );
  }
}