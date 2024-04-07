import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:module04/main_body.dart';
import 'package:module04/diary_appbar.dart';
import 'package:module04/state.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const DiaryAppBar(),
          ),
          body: MainBody(store: store),
        ),
      ),
    );
  }
}
