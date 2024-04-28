import 'package:diaryapp/models/diary_model.dart';
import 'package:diaryapp/views/widget/modals/new_entry/content_field.dart';
import 'package:diaryapp/views/widget/modals/new_entry/feeling_selection.dart';
import 'package:diaryapp/views/widget/modals/new_entry/row_title_close.dart';
import 'package:diaryapp/views/widget/modals/new_entry/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            child: Column(
              children: [
                RowTitleClose(titleController: titleController),
                const SizedBox(height: 10),
                FeelingSelection(feelingController: feelingController),
                const SizedBox(height: 10),
                ContentField(contentController: contentController),
                const SizedBox(height: 10),
                SubmitButton(
                  controller: controller,
                  titleController: titleController,
                  feelingController: feelingController,
                  contentController: contentController,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
