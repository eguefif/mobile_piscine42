import 'package:diaryapp/views/widget/entries.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return const Entries();
  }
}
