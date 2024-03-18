import 'package:flutter/material.dart';
import 'package:ex03/widgets/fields.dart';
import 'package:ex03/widgets/pad.dart';
import 'package:ex03/models/expression.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});


  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreen();
  }
}

class _CalculatorScreen extends State<CalculatorScreen> {
  final List<Expression> expressions = [Expression()];
  final restartValues = "123456789+-";

  void updateExpression(String value) {
    setState(() {
      if (expressions.first.isResult && restartValues.contains(value)){
        expressions.insert(0, Expression());
      }
      expressions.first.update(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Fields(expressions: expressions),
        Pad(updateExpression: updateExpression),
      ],
    );
  }
}
