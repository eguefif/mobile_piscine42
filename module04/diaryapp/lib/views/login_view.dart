import 'package:diaryapp/views/widget/buttons/login_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.login});

  final Function login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginButton(login: login),
    );
  }
}
