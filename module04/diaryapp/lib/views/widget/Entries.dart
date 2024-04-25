import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Entries extends StatelessWidget {
  const Entries({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryModel>(
      builder: (context, controller, child) {
        return ListView.builder(
          itemCount: controller.entries.length,
          itemBuilder: (ctx, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_getDate(controller.entries[index].date)),
                Text(controller.entries[index].feeling.toString()),
                Text(controller.entries[index].title,
                    style: Theme.of(context).textTheme.headlineLarge),
              ],
            );
          },
        );
      },
    );
  }

  String _getDate(int date) {
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    return "${dt.day}/${dt.month}/${dt.year}";
  }
}
