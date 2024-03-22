import 'package:flutter/material.dart';
import 'package:module03/controllers/geodata_fetcher.dart';
import 'package:module03/models/default_search_values.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key, required this.changeLocation, required this.switchLoading});

  final void Function(List<double>) changeLocation;
  final void Function() switchLoading;

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
                //controller.openView();
              },
            );
          },
        ).catchError((error) {
          entries = defaultValues;
        });
      } else {
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
          controller.addListener(refreshView);
          _controller = controller;
          controller.openView();
        },
        onChanged: (_) {
          controller.openView();
        },
        onSubmitted: (_) {
          controller.removeListener(refreshView);
          controller.closeView(controller.text);
        },
        leading: const Icon(Icons.search),
      ),
      suggestionsBuilder: (context, controller) => List<Column>.generate(
        5,
        (int index) {
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
              ListTile(
                title: Text(entry),
                leading: const Icon(Icons.location_city),
                onTap: () {
                  setState(
                    () {
                      hasTapped = true;
                      widget.switchLoading();
                      controller.closeView(entry);
                      controller.removeListener(refreshView);
                      widget.changeLocation([
                        entries[index]["latitude"],
                        entries[index]["longitude"],
                      ]);
                    },
                  );
                },
              ),
              if (index < 4) const Divider(),
            ],
          );
        },
      ),
    );
  }
}
