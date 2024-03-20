import 'package:flutter/material.dart';
import 'package:weatherappv2proj/widget/top_bar.dart';
import 'package:weatherappv2proj/widget/gps_button.dart';
import 'package:weatherappv2proj/widget/current_screen.dart';
import 'package:weatherappv2proj/widget/today_screen.dart';
import 'package:weatherappv2proj/widget/weekly_screen.dart';
import 'package:weatherappv2proj/models/weather_data.dart';
import 'package:weatherappv2proj/controllers/weather_fetcher.dart';
import 'package:geolocator/geolocator.dart';

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
  WeatherData data = const WeatherData(
    location: {"city": "None", "state": "", "country": ""},
    currentConditions: {"temp": null, "description": "", "speed": null},
    today: {"hours": [], "temperature": [], "description": [], "speed": []},
    week: {"date": [], "maxs": [], "mins": [], "description": []},
  );

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
    });
    super.initState();
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(
          "Cannot get your location, geolocator is not activated");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Cannot get your location, permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions");
    }
    return await Geolocator.getCurrentPosition();
  }

  void changeLocation(String newLocation) {
    setState(() {
      location = newLocation;
    });
  }

  void fetchWeather() async {
    Position position = await getLocation();
    WeatherFetcher fetcher = WeatherFetcher(
        latitude: position.latitude, longitude: position.longitude);
    var tmpData = await fetcher.fetchWeather();
    setState(() {
      data = tmpData;
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
