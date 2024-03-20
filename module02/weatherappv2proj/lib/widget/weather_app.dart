import 'package:flutter/material.dart';
import 'package:weatherappv2proj/widget/top_bar.dart';
import 'package:weatherappv2proj/widget/gps_button.dart';
import 'package:weatherappv2proj/widget/current_screen.dart';
import 'package:weatherappv2proj/widget/today_screen.dart';
import 'package:weatherappv2proj/widget/weekly_screen.dart';
import 'package:weatherappv2proj/models/weather_data.dart';
import 'package:weatherappv2proj/controllers/weather_fetcher.dart';
import 'package:weatherappv2proj/controllers/locator_controller.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() {
    return _WeatherApp();
  }
}

class _WeatherApp extends State<WeatherApp> {
  String location = "";
  String key = "";
  WeatherData data = WeatherData.fromNothing();

  @override
  void initState() {
    getLocation().then((position) {
      WeatherFetcher fetcher = WeatherFetcher(
          latitude: position.latitude, longitude: position.longitude);
      fetcher.fetchWeather().then((newData) {
        setState(() {
          data = newData;
        });
      });
    }).catchError((error) {
      setState(() {
        data.error["error"] = true;
        data.error["msg"] = error;
      });
    });
    super.initState();
  }

  void changeLocation(String newLocation) {
    setState(() {
      location = newLocation;
    });
  }

  void fetchWeather() async {
    getLocation().then((position) {
      WeatherFetcher fetcher = WeatherFetcher(
          latitude: position.latitude, longitude: position.longitude);
      fetcher.fetchWeather().then((tmpData) {
        setState(() {
          data = tmpData;
        });
      });
    }).catchError((error) {
      setState(() {
        data.error["error"] = true;
        data.error["msg"] = error;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TopBar(changeLocation: changeLocation),
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: <Widget>[
            GpsButton(fetchWeather: fetchWeather),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            CurrentScreen(data: data),
            TodayScreen(data: data),
            WeeklyScreen(data: data),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.now_widgets), child: Text("Currently")),
            Tab(icon: Icon(Icons.calendar_today), child: Text("Today")),
            Tab(icon: Icon(Icons.calendar_view_week), child: Text("Weekly")),
          ],
        ),
      ),
    );
  }
}
