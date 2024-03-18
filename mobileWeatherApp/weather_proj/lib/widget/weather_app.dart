import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Expanded(
            child: Row(
              children: [
                Icon(Icons.search),
                TextField(),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("Currently")),
            Center(child: Text("Today")),
            Center(child: Text("Weekly")),
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
