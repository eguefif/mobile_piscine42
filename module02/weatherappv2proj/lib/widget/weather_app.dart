import 'package:flutter/material.dart';
import 'package:weatherappv2proj/widget/body_content.dart';
import 'package:weatherappv2proj/widget/top_bar.dart';
import 'package:weatherappv2proj/widget/gps_button.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() {
    return _WeatherApp();
  }
}

class _WeatherApp extends State<WeatherApp> {
  String location = "";
  void changeLocation(String newLocation) {
    setState(() {
      location = newLocation;
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
            GpsButton(changeLocation: changeLocation),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            BodyContent(location: location, title: "Currently"),
            BodyContent(location: location, title: "Today"),
            BodyContent(location: location, title: "Weekly"),
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
