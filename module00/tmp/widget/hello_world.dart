import 'package:flutter/material.dart';
import 'package:ex01/widget/button.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() {
    return _HelloWorld();
  }
}

class _HelloWorld extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Card(
              color: Color.fromARGB(255, 75, 97, 37),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "A simple text",
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
           const HelloButton(),
          ],
        ),
      ),
    );
  }
}