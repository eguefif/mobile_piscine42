import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton(
      {super.key,
      required this.label,
      required this.color,
      required this.action});

  final String label;
  final Color color;

  final void Function(String value) action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          action(label);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 40, 117, 111),
          foregroundColor: color,
          padding: const EdgeInsets.all(0),
          shape: const BeveledRectangleBorder(),
        ),
        child: Text(label),
      ),
    );
  }
}
