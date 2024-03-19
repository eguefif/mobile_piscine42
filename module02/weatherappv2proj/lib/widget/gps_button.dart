import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsButton extends StatelessWidget {
  const GpsButton({super.key, required this.changeLocation});


  final void Function(String location) changeLocation;

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled){
      return Future.error("Cannot get your location, geolocator is not activated");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied){
        return Future.error("Cannot get your location, permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever){
      return Future.error("Location permissions are permanently denied, we cannot request permissions");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.location_pin),
      tooltip: 'your location',
      onPressed: () async {
        Position location = await getLocation();
        changeLocation("Lat ${location.latitude} long ${location.longitude}");
      },
    );
  }
}
