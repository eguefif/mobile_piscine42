import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewEntry extends StatefulWidget {
  const NewEntry({super.key});

  @override
  State<StatefulWidget> createState() => _NewEntry();
}

class _NewEntry extends State<NewEntry> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  int feelingDay = 0;

  void changeFeeling(int feeling) {
    setState(() {
      feelingDay = feeling;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Consumer<DiaryModel>(
        builder: (context, controller, child) {
          Entry? entry;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Text("Title"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Feeling(changeFeeling: changeFeeling),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _contentController,
                    keyboardType: TextInputType.multiline,
                    minLines:1,
                    maxLines: 15,
                    maxLength: 500,
                    decoration: const InputDecoration(
                      label: Text("Content"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.addEntry(entry!);
                      },
                      child: const Text("Add entry"),
                    ),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Feeling extends StatelessWidget {
  const Feeling({super.key, required this.changeFeeling});

  final Function(int) changeFeeling;

  @override
  Widget build(BuildContext context) {
    return const Text("Feeling");
  }
}
