import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:module04/states/state.dart';
import 'package:module04/views/diary_page.dart';

void main() {
  final store = Store<AppState>(actionReducer, initialState: const AppState());

  runApp(
    DiaryPage(store: store),
  );
}
