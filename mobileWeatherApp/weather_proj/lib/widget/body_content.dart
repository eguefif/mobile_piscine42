import 'package:flutter/material.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({super.key, required this.location, required this.title});

  final String location;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(location, style: Theme.of(context).textTheme.titleLarge),
          Text(title, style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
    );
  }
}
