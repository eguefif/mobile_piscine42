import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar(
      {super.key, required this.changeLocation});

  final void Function(List<double>) changeLocation;

  @override
  Widget build(BuildContext context) {
    SearchController searchController = SearchController();
    FocusScope.of(context).unfocus();
    searchController.clear();
    return SearchBar(
        autoFocus: false,
        onTap: () {
          Navigator.of(context).pushNamed('/searchPage',
              arguments: changeLocation);
        },
        onChanged: (String value) {
          searchController.clear();
          FocusScope.of(context).unfocus();
          Navigator.of(context).pushNamed('/searchPage',
              arguments: changeLocation);
        });
  }
}
