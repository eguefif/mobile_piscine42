import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewEntry extends StatelessWidget {
  const NewEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Consumer<DiaryModel>(
        builder: (context, controller, child) {
          final titleController = TextEditingController();
          final contentController = TextEditingController();
          final feelingController = TextEditingController();
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Expanded(
                        child: TextField(
                          controller: titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Text("Title"),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropdownMenu<Feeling>(
                    initialSelection: Feeling.neutral,
                    controller: feelingController,
                    requestFocusOnTap: true,
                    label: const Text("Feeling"),
                    dropdownMenuEntries: Feeling.values
                        .map<DropdownMenuEntry<Feeling>>(
                          (Feeling feeling) => DropdownMenuEntry<Feeling>(
                            value: feeling,
                            label: feeling.description,
                            leadingIcon: SvgPicture.asset(feeling.asset,
                                semanticsLabel: feeling.description),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: TextField(
                      controller: contentController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 15,
                      maxLength: 500,
                      decoration: const InputDecoration(
                        label: Text("Content"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Entry entry = Entry(
                            title: titleController.text,
                            content: contentController.text,
                            date: DateTime.now().millisecondsSinceEpoch ~/ 1000,
                            feeling: feelingController.text,
                          );
                          if (_checkEntry(entry)) {
                            controller.addEntry(entry);
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog.adaptive(
                                title: const Text("Invalid input"),
                                content: const Text(
                                    "Make sure you wrote something for title and content"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: const Text("Okey"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text("Add entry"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _checkEntry(Entry entry) {
    if (entry.title.isEmpty || entry.content.isEmpty) {
      return false;
    }
    return true;
  }
}
