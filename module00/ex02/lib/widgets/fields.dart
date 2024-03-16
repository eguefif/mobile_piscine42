import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
  const Fields({super.key, required this.result, required this.expression});

  final String result;
  final String expression;

  final TextStyle fieldStyle = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(expression, style: fieldStyle),
            const SizedBox(height: 5),
            Text(result, style: fieldStyle),
          ],
        ),
      ),
    );
  }
}
