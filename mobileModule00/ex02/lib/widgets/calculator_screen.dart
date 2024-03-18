import 'package:flutter/material.dart';
import 'package:ex02/widgets/fields.dart';
import 'package:ex02/widgets/pad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreen();
  }
}

class _CalculatorScreen extends State<CalculatorScreen> {
  String expression = "0";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Fields(expression: expression, result: result),
        const Pad(),
      ],
    );
  }
}