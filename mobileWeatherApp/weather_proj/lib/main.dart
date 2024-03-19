import 'package:flutter/material.dart';
import 'package:weather_proj/widget/weather_app.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 129, 126, 139));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      home: const WeatherApp(),
    ),
  );
}
