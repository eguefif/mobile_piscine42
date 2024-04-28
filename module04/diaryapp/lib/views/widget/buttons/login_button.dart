import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.login});

  final Function login;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Welcome to your diary",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 59, 168, 62),
                foregroundColor: Colors.white,
                side: const BorderSide(
                  color: Color.fromARGB(255, 29, 61, 30),
                  width: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () async {
                await login();
              },
              child: const Text("Log in"),
            ),
          ),
        ],
      ),
    );
  }
}
