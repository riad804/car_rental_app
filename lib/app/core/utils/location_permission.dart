
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<void> checkLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Get.rawSnackbar(message: 'Location services are disabled.');
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      Get.showSnackbar(GetSnackBar(
        message: 'Location permission are needed',
        backgroundColor: Colors.red.shade400,
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.TOP,
        mainButton: ElevatedButton(
          onPressed: () {
            Geolocator.openLocationSettings();
          },
          child: const Text("Turn On"),
        ),
      ));
      return;
    }
    return;
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    // return Future.error(
    //     // 'Location permissions are permanently denied, we cannot request permissions.');
    //     'Need Location Permission');
    Get.showSnackbar(GetSnackBar(
      message: 'Location permission are needed',
      backgroundColor: Colors.red.shade400,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.TOP,
      mainButton: ElevatedButton(
        onPressed: () {
          Geolocator.openLocationSettings();
        },
        child: const Text("Turn On"),
      ),
    ));
    return;
  }
}