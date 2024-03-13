import 'package:flutter/material.dart';

class SimpleBttn extends StatelessWidget {
  const SimpleBttn({super.key});

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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: const Color.fromARGB(255, 236, 236, 196),
                //foregroundColor: Color.fromARGB(255, 44, 54, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                ),
              ),
              onPressed: () {
                print("Button pressed");
              },
              child: const Text(
                "Click me",
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 67, 77, 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
