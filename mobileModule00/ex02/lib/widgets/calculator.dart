import 'package:flutter/material.dart';
import 'package:ex02/widgets/calculator_screen.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text("Calculator"),
        ),
      ),
      body: const CalculatorScreen(),
    );
  }
}
