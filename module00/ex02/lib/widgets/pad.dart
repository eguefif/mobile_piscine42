import 'package:flutter/material.dart';

import 'package:ex02/widgets/buttons/pad_button.dart';

class Pad extends StatelessWidget {
  Pad({super.key, required this.updateExpression});

  function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FirstRow(),
          SecondRow(),
          ThirdRow(),
          ForthRow(),
        ],
      ),
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "7", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "8", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "9", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "C", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "AC", color: Color.fromARGB(255, 255, 0, 0)),
        ],
      ),
    );
  }
}

class SecondRow extends StatelessWidget {
  const SecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "4", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "5", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "6", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "+", color: Color.fromARGB(255, 255, 255, 255)),
          BuildButton(label: "-", color: Color.fromARGB(255, 255, 255, 255)),
        ],
      ),
    );
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "1", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "2", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "3", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "x", color: Color.fromARGB(255, 255, 255, 255)),
          BuildButton(label: "/", color: Color.fromARGB(255, 255, 255, 255)),
        ],
      ),
    );
  }
}

class ForthRow extends StatelessWidget {
  const ForthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "0", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: ".", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "00", color: Color.fromARGB(255, 0, 0, 0)),
          BuildButton(label: "=", color: Color.fromARGB(255, 255, 255, 255)),
          Spacer(),
        ],
      ),
    );
  }
}
