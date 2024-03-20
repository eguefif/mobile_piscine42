import 'package:flutter/material.dart';
import 'package:weatherappv2proj/controllers/geodata_fetcher.dart';
import 'package:weatherappv2proj/models/default_search_values.dart';

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
                print("TEEEEEST");
                controller.openView();
              },
            );
          },
        ).catchError((error) {
          entries = defaultValues;
        });
      }
      else {
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
          //controller.openView();
        },
        onSubmitted: (_){
          controller.removeListener(refreshView);
          controller.closeView(controller.text);
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
                  hasTapped = true;
                  controller.closeView(entry);
                  controller.removeListener(refreshView);
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
