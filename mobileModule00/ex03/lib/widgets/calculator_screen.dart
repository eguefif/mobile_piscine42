import 'package:flutter/material.dart';
import 'package:ex03/widgets/fields.dart';
import 'package:ex03/widgets/pad.dart';
import 'package:ex03/controllers/expression.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});


  @override
  State<CalculatorScreen> createState() {
    return _CalculatorScreen();
  }
}

class _CalculatorScreen extends State<CalculatorScreen> {
  final List<Expression> expressions = [Expression()];

  void updateExpression(String value) {
    setState(() {
      if (expressions.first.isResult && value != "="){
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
