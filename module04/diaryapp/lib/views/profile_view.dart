import 'package:diaryapp/views/widget/profile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Profile(logout: logout),
    );
  }
}
