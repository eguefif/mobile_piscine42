import 'package:flutter/material.dart';
import 'package:weather_proj/widget/body_content.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() {
    return _WeatherApp();
  }
}

class _WeatherApp extends State<WeatherApp> {
  String location = "";
  final _controllerSearch = TextEditingController();

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

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
            title: Row(
              children: [
                const Icon(Icons.search),
                Expanded(
                  child: TextField(
                    controller: _controllerSearch,
                    onSubmitted: changeLocation,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.location_pin),
                tooltip: 'your location',
                onPressed: () {},
              ),
            ]),
        body: TabBarView(
          children: <Widget>[
            BodyContent(location: location, title: "Currently"),
            BodyContent(location: location, title: "Today"),
            BodyContent(location: location, title: "Weekly"),
          ],
        ),
        bottomNavigationBar: const TabBar(
          tabs: <Widget>[
            Tab(child: Text("Currently")),
            Tab(child: Text("Today")),
            Tab(child: Text("Weekly")),
          ],
        ),
      ),
    );
  }
}
