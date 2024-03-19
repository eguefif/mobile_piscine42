import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key, required this.changeLocation});

  final void Function(String location) changeLocation;

  @override
  State<TopBar> createState() {
    return _TopBar();
  }
}

class _TopBar extends State<TopBar> {
  final _controllerSearch = TextEditingController();

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Icon(Icons.search),
          Expanded(
            child: TextField(
              controller: _controllerSearch,
              onSubmitted: widget.changeLocation,
            ),
          ),
          const VerticalDivider(),
        ],
      );
  }
}
