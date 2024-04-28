import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.login});

  final Function login;

  @override
  Widget build(context) {
    return SizedBox(
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
    );
  }
}
