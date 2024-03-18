import 'package:flutter/material.dart';
import 'package:ex01/widget/button.dart';
import 'package:ex01/widget/simple_text.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() {
    return _HelloWorld();
  }
}

class _HelloWorld extends State<HelloWorld> {
    String text = "A simple text";

    void changeText() {
      setState(() {
        if (text == "A simple text") {
          text = "Hello World";
        }
        else {
          text = "A simple text";
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SimpleText(text: text),
            const SizedBox(height: 10),
           HelloButton(changeText: changeText),
          ],
        ),
      ),
    );
  }
}