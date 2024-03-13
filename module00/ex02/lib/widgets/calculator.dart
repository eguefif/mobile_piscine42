import 'package:flutter/material.dart';
import 'package:ex02/widgets/calculator_screen.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 34, 104),
        foregroundColor: Colors.white,
        title: const Center(
          child: Text("Calculator"),
        ),
      ),
      body: const Center(
        child: CalculatorScreen(),
      ),
    );
  }
}
