import 'package:diaryapp/views/widget/Entries.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Expanded(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await logout();
                },
                child: const Text("Log out"),
              ),
              const Expanded(child: Entries()),
            ],
          ),
        ),
      ),
    );
  }
}