import 'package:diaryapp/views/widget/modals/new_entry.dart';
import 'package:diaryapp/views/widget/profile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diary app"),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await logout();
            },
            child: const Text("Log out"),
          ),
        ],
      ),
      body: const SafeArea(
        child: Profile(),
      ),
      floatingActionButton: IconButton(
        iconSize: 55,
        style: IconButton.styleFrom(
          elevation: 10,
            backgroundColor: const Color.fromARGB(255, 13, 178, 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(
                color: Color.fromARGB(255, 25, 43, 26),
                width: 4,
              ),
            )),
        icon: const Icon(Icons.add),
        onPressed: () {
          openAddEntryModal(context);
        },
      ),
    );
  }
}
