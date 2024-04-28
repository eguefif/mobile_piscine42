import 'package:diaryapp/views/widget/modals/show_add_entry_modal.dart';
import 'package:diaryapp/views/widget/profile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Diary app", style: Theme.of(context).textTheme.displayMedium),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(10),
            style: _getButtonStyle(),
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await logout();
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(
                height: 25,
                thickness: 5,
                color: Colors.black,
                indent: 25,
                endIndent: 25),
            Expanded(child: Profile()),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        padding: const EdgeInsets.all(10),
        iconSize: 55,
        style: _getButtonStyle(),
        icon: const Icon(Icons.add),
        onPressed: () {
          openAddEntryModal(context);
        },
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return IconButton.styleFrom(
      elevation: 10,
      backgroundColor: const Color.fromARGB(255, 13, 178, 18),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: const BorderSide(
          color: Color.fromARGB(255, 25, 43, 26),
          width: 4,
        ),
      ),
    );
  }
}
