import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:module04/states/state.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Column(
        children: [
          StoreConnector<AppState, String>(
            converter: (store) {
              return store.state.logged ? "Welcome" : "Please log in";
            },
            builder: (context, text) {
              return Text(text);
            },
          ),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(LogInOut.login);
            },
            builder: (context, callback) {
              return ElevatedButton(
                onPressed: callback,
                child: const Text("Login"),
              );
            },
          ),
        ],
      ),
    );
  }
}