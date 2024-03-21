import 'package:flutter/material.dart';
import 'package:module03/models/weather_data.dart';

class ErrorBody extends StatelessWidget {
  const ErrorBody({super.key, required this.data, required this.title});

  final String title;
  final WeatherData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          Text(data.error["msg"],
              style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
