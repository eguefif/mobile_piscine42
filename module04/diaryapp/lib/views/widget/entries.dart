import 'package:diaryapp/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            return ElevatedButton(
              onPressed: () {
                _showEntryModal(controller.getEntry(index), context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(_getDate(controller.entries[index].date)),
                  _getFeelingSvg(controller.entries[index].feeling.toString()),
                  Text(controller.entries[index].title,
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
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

  _getFeelingSvg(String string) {
    switch (string) {
      case "smile":
        return SvgPicture.asset(Feeling.smile.asset,
            semanticsLabel: Feeling.smile.description);
      case "anger":
        return SvgPicture.asset(Feeling.anger.asset,
            semanticsLabel: Feeling.anger.description);
      case "sad":
        return SvgPicture.asset(Feeling.sad.asset,
            semanticsLabel: Feeling.sad.description);
      case "neutral":
        return SvgPicture.asset(Feeling.neutral.asset,
            semanticsLabel: Feeling.neutral.description);
    }
  }

  void _showEntryModal(Entry entry, context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Center(
        child: Column(
          children: [
            Text(entry.title),
            _getFeelingSvg(entry.feeling),
            Text(entry.content),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Return"),
            ),
          ],
        ),
      ),
    );
  }
}
