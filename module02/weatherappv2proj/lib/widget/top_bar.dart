import 'package:flutter/material.dart';
import 'package:weatherappv2proj/controllers/geodata_fetcher.dart';

List<Map<String, dynamic>> defaultValues = [
  {"city": "Paris", "state": "None", "country": "fr", "latitude": 48.8566, "longitude": 2.3522},
  {"city": "Tokyo", "state": "None", "country": "jp", "latitude": 35.6764, "longitude": 139.65},
  {"city": "Berlin", "state": "None", "country": "Germany", "latitude": 52.52, "longitude": 13.4050},
  {"city": "London", "state": "None", "country": "UK", "latitude": 51.5072, "longitude": 0.1276},
  {"city": "Madrid", "state": "None", "country": "UK", "latitude": 40.4168, "longitude": 3.7038},
  {"city": "Roma", "state": "None", "country": "UK", "latitude": 41.9028, "longitude": 12.4964},
  {"city": "Washington", "state": "D.C.", "country": "US", "latitude": 38.9072, "longitude": -77.0369},
  {"city": "New-York", "state": "NY state", "country": "US", "latitude": 40.7128, "longitude": -74.0060},
  {"city": "San Francisco", "state": "California", "country": "US", "latitude": 37.7739, "longitude": -122.4312},
  {"city": "Ottawa", "state": "Ontario", "country": "Canada", "latitude": 45.24721, "longitude": -75.695},
  {"city": "Montreal", "state": "Quebec", "country": "Canada", "latitude": 45.5088, "longitude": -73.5616},
  {"city": "Vancouver", "state": "BC", "country": "Canada", "latitude": 49.2827, "longitude": 123.1207},
  {"city": "Beijing", "state": "Tongzhou", "country": "China", "latitude": 39.9042, "longitude": 116.4074},
  {"city": "Canberra", "state": "New South Wales", "country": "Australia", "latitude": 35.2802, "longitude": 149.1310},
  {"city": "Brazilia", "state": "Goias", "country": "Brazil", "latitude": 15.7975, "longitude": 47.8919},
];

class TopBar extends StatefulWidget {
  const TopBar({super.key, required this.changeLocation});

  final void Function(List<double>) changeLocation;

  @override
  State<TopBar> createState() {
    return _TopBar();
  }
}

class _TopBar extends State<TopBar> {
  List<Map<String, dynamic>> entries = defaultValues;
  SearchController? _controller;
  bool hasTapped = false;

  void refreshView() {
    if (_controller != null) {
      SearchController controller = _controller!;
      if (controller.text.length >= 3) {
        geoDataFetcher(controller.text).then(
          (fetcherRetval) {
            setState(
              () {
                entries = fetcherRetval;
                print("NEW data $entries");
                print("DId he tapped: $hasTapped");
                /*
                if (!hasTapped){
                  controller.openView();
                }
                */
              },
            );
          },
        ).catchError((error) {
          entries = defaultValues;
        });
      }
      else {
        print("DEFAULT");
        entries = defaultValues;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, controller) => SearchBar(
        controller: controller,
        padding: const MaterialStatePropertyAll(EdgeInsets.all(3.0)),
        onTap: () {
          _controller = controller;
          //controller.openView();
          controller.addListener(refreshView);
        },
        onChanged: (_) {
          controller.openView();
        },
        leading: const Icon(Icons.search),
      ),
      suggestionsBuilder: (context, controller) => List<ListTile>.generate(
        20,
        (int index) {
          if (index >= entries.length){
            return const ListTile(title: Text(""));
          }
          final String city = entries[index]["city"];
          final String state = entries[index]["state"];
          final String country = entries[index]["country"];

          String entry = city;
          if (state != "None") {
            entry += " $state";
          }
          entry += " $country";
          return ListTile(
            title: Text(entry),
            onTap: () {
              setState(
                () {
                  print("test $entry");
                  hasTapped = true;
                  controller.closeView(entry);
                  widget.changeLocation([
                    entries[index]["latitude"],
                    entries[index]["longitude"],
                  ]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
