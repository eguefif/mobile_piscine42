import 'package:flutter/material.dart';
import 'package:ex03/models/expression.dart';

class Fields extends StatelessWidget {
  const Fields({super.key, required this.expressions});

  final List<Expression> expressions;

  final TextStyle fieldStyle = const TextStyle(
    fontSize: 25,
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
        child: ListView.builder(
          itemCount: expressions.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(expressions[index].expression, style: fieldStyle),
                const SizedBox(height: 5),
                Text(expressions[index].result, style: fieldStyle),
                const Divider()
              ],
            );
          },
        ),
        /*
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SingleChildScrollView(
              controller: 
              child: Text(expression, style: fieldStyle)),
            const SizedBox(height: 5),
            Text(result, style: fieldStyle),
          ],
        ),
        */
      ),
    );
  }
}
