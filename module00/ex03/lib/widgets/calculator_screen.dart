import 'package:flutter/material.dart';
import 'package:ex03/widgets/fields.dart';
import 'package:ex03/widgets/pad.dart';
import 'package:ex03/models/expression.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreen();
  }
}

class _CalculatorScreen extends State<CalculatorScreen> {
  Expression expression = Expression();

  void updateExpression(String value) {
    setState(() {
      expression.update(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Fields(
            expression: expression.expression,
            result: expression.result),
        Pad(updateExpression: updateExpression),
      ],
    );
  }
}
