import 'package:flutter/material.dart';

import 'package:ex02/widgets/buttons/button_number.dart';
import 'package:ex02/widgets/buttons/button_clear.dart';

class Pad extends StatelessWidget {
  const Pad({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final height = constraints.maxHeight;
        return Container(
          alignment: Alignment.topRight,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FirstRow(),
              FirstRow(),
            ],
          ),
        );
      },
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonNumber(label: "7"),
          ButtonNumber(label: "8"),
          ButtonNumber(label: "9"),
          ButtonClear(label: "C"),
          ButtonClear(label: "AC"),
      ],),
    );
  }
}
