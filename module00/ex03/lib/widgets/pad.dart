import 'package:flutter/material.dart';

import 'package:ex03/widgets/buttons/pad_button.dart';

class Pad extends StatelessWidget {
  const Pad({super.key, required this.updateExpression});

  final void Function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FirstRow(updateExpression: updateExpression),
          SecondRow(updateExpression: updateExpression),
          ThirdRow(updateExpression: updateExpression),
          ForthRow(updateExpression: updateExpression),
        ],
      ),
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key, required this.updateExpression});

  final void Function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "7", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "8", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "9", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "C", color: const Color.fromARGB(255, 255, 0, 0), action: updateExpression),
          BuildButton(label: "AC", color: const Color.fromARGB(255, 255, 0, 0), action: updateExpression),
        ],
      ),
    );
  }
}

class SecondRow extends StatelessWidget {
  const SecondRow({super.key, required this.updateExpression});

  final void Function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "4", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "5", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "6", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "+", color: const Color.fromARGB(255, 255, 255, 255), action: updateExpression),
          BuildButton(label: "-", color: const Color.fromARGB(255, 255, 255, 255), action: updateExpression),
        ],
      ),
    );
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({super.key, required this.updateExpression});

  final void Function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "1", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "2", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "3", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "*", color: const Color.fromARGB(255, 255, 255, 255), action: updateExpression),
          BuildButton(label: "/", color: const Color.fromARGB(255, 255, 255, 255), action: updateExpression),
        ],
      ),
    );
  }
}

class ForthRow extends StatelessWidget {
  const ForthRow({super.key, required this.updateExpression});

  final void Function(String value) updateExpression;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BuildButton(label: "0", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: ".", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "00", color: const Color.fromARGB(255, 0, 0, 0), action: updateExpression),
          BuildButton(label: "=", color: const Color.fromARGB(255, 255, 255, 255), action: updateExpression),
          const Spacer(),
        ],
      ),
    );
  }
}
