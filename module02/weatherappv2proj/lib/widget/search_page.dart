import 'package:flutter/material.dart';
import 'package:weatherappv2proj/controllers/geodata_fetcher.dart';
import 'package:weatherappv2proj/models/default_values_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.changeLocation});

  final void Function(List<double>) changeLocation;

  @override
  State<SearchPage> createState() {
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
  List<Map<String, dynamic>> entries = defaultValues;
  bool hasTapped = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void refreshView() {
    if (controller.text.length < 3) return;
    geoDataFetcher(controller.text).then(
      (fetcherRetval) {
        setState(
          () {
            entries = fetcherRetval;
          },
        );
      },
    ).catchError(
      (error) {
        setState(
          () {
            entries = [
              {"error": error}
            ];
          },
        );
      },
    );
  }

  void selectItem(double latitude, double longitude) {
    setState(
      () => widget.changeLocation(
        [latitude, longitude],
      ),
    );
    controller.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.onPrimary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            hintText: "eg: Paris",
            prefixIcon: const Icon(Icons.search),
          ),
          controller: controller,
          onChanged: (_) {
            refreshView();
          },
          onTap: () {},
        ),
      ),
      body: ListView.builder(
        itemCount: entries.length < 5 ? entries.length : 5,
        itemBuilder: (context, index) {
          //getCityItem(entries[index], selectItem, index),),
          if (entries[0].keys.contains("error")) {
            return ListTile(
                title: Text(
                  entries[0]["error"],
                  style: const TextStyle(color: Colors.red),
                ),
            );
          }

          final String city = entries[index]["city"];
          final String state = entries[index]["state"];
          final String country = entries[index]["country"];

          String entry = city;
          if (state != "None") {
            entry += " $state";
          }
          entry += " $country";
          return Column(
            children: [
              const Divider(),
              ListTile(
                title: Text(entry),
                leading: const Icon(Icons.location_city),
                onTap: () {
                  selectItem(
                      entries[index]["latitude"], entries[index]["longitude"]);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
