import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget{
  const BuildButton({super.key, required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {print("Button pressed $label");},
        style:  ElevatedButton.styleFrom(
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