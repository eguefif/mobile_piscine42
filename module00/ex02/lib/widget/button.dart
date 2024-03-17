import 'package:flutter/material.dart';

class HelloButton extends StatelessWidget {
  const HelloButton({super.key, required this.changeText});

  final Function() changeText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
        backgroundColor: const Color.fromARGB(255, 236, 236, 196),
        //foregroundColor: Color.fromARGB(255, 44, 54, 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
      ),
      onPressed: () {
        changeText();
      },
      child: const Text(
        "Click me",
        style: TextStyle(
          fontSize: 12,
          color: Color.fromARGB(255, 67, 77, 20),
        ),
      ),
    );
  }
}
