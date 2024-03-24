import 'package:flutter/material.dart';
import 'package:weatherappv2proj/widget/weather_app.dart';
import 'package:weatherappv2proj/widget/search_page.dart';

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
      onGenerateRoute: (settings) {
        if (settings.name == '/searchPage') {
          return MaterialPageRoute(
            builder: (context) => SearchPage(
              changeLocation: settings.arguments as void Function(List<double>),
            ),
          );
        }
        return MaterialPageRoute(builder: (context) => const WeatherApp());
      },
    ),
  );
}
