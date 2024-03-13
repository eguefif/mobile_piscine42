import 'package:flutter/material.dart';

class ButtonClear extends StatelessWidget {
  const ButtonClear({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style:  ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 155, 100, 100),
        foregroundColor: const Color.fromARGB(255, 255, 50, 50),
        shape: const BeveledRectangleBorder()
      ),
      child: Text(label),
    );
  }
}