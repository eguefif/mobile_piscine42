import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget{
  const ButtonNumber({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style:  ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 155, 100, 100),
        shape: const BeveledRectangleBorder()
      ),
      child: Text(label),
    );
  }
}