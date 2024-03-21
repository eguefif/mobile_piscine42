import 'package:flutter/material.dart';
import 'package:module03/widget/weather_app.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 221, 92, 18), brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kColorScheme,
        textTheme: TextTheme(
          bodySmall: TextStyle(color: kColorScheme.onBackground, fontSize: 10),
          bodyMedium: TextStyle(color: kColorScheme.tertiary, fontSize: 20),
          titleMedium: TextStyle(
            color: kColorScheme.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: kColorScheme.primary,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const WeatherApp(),
    ),
  );
}
