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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final height = constraints.maxHeight;
        return Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.topRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(expression, style: fieldStyle),
              const SizedBox(height: 5),
              Text(result, style: fieldStyle),
            ],
          ),
        );
      },
    );
  }
}
