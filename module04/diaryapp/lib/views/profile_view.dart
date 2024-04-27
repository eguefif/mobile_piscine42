import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/new_entry.dart';
import 'package:diaryapp/views/widget/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.logout});

  final Function logout;

  void _openAddEntryModal(context) {
    final diaryModel = Provider.of<DiaryModel>(context, listen: false);
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: diaryModel,
        child: const NewEntry(),
      ),
    );
  }

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
      body: SafeArea(
        child: Profile(logout: logout),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          _openAddEntryModal(context);
        },
      ),
    );
  }
}
