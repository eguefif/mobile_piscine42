import 'package:flutter/material.dart';

class NoneDataBody extends StatelessWidget {
  const NoneDataBody({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Text("Fetching data"),
        ],
      ),
    );
  }
}
