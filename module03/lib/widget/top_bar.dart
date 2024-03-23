import 'package:flutter/material.dart';
import 'package:module03/controllers/geodata_fetcher.dart';
import 'package:module03/models/default_search_values.dart';

class TopBar extends StatefulWidget {
  const TopBar(
      {super.key, required this.changeLocation, required this.switchLoading});

  final void Function(List<double>) changeLocation;
  final void Function() switchLoading;

  @override
  State<TopBar> createState() {
    return _TopBar();
  }
}

class _TopBar extends State<TopBar> {
  List<Map<String, dynamic>> entries = defaultValues;
  bool hasTapped = false;
  late TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  void updateView(String value) {
    print("Update $value");
  }

  void refreshView() {
    geoDataFetcher("paris").then(
      (fetcherRetval) {
        setState(
          () {
            entries = fetcherRetval;
            //controller.openView();
          },
        );
      },
    ).catchError((error) {
      entries = defaultValues;
    });
  }

  void selectItem() {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (String value) async {updateView(value);},
    );
  }
}
/*
      suggestionsBuilder: (context, controller) => List<Column>.generate(
        5,
        (int index) {
          return getCityItem(entries[index], selectItem, index);
        },
        */

Column getCityItem(
    Map<String, dynamic> data, void Function() selectItem, int index) {
  final String city = data["city"];
  final String state = data["state"];
  final String country = data["country"];

  String entry = city;
  if (state != "None") {
    entry += " $state";
  }
  entry += " $country";
  return Column(
    children: [
      ListTile(
          title: Text(entry),
          leading: const Icon(Icons.location_city),
          onTap: () {
            selectItem();
          }),
      if (index < 4) const Divider(),
    ],
  );
}
