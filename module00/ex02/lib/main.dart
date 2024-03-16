import 'package:flutter/material.dart';
import 'package:ex02/widgets/calculator.dart';

void main() {
  runApp(
    MaterialApp(
      title: "calculator",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 117, 111),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 40, 117, 111)),
      ),
      home: const Calculator(),
    ),
  );
}
