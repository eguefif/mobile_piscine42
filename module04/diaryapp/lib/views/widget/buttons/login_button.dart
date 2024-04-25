import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.login});

  final Function login;

  @override
  Widget build(context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await login();
        },
        child: const Text("Log in"),
      ),
    );
  }
}
