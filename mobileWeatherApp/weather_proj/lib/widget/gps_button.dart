import 'package:flutter/material.dart';

class GpsButton extends StatelessWidget {
  const GpsButton({super.key, required this.changeLocation});

  final void Function(String location) changeLocation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.location_pin),
      tooltip: 'your location',
      onPressed: () {
        changeLocation("Geolocation");
      },
    );
  }
}
