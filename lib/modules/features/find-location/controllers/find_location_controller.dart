// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class FindLocationController extends GetxController {
  var latitude = ''.obs;
  var longitude = ''.obs;
  var address = ''.obs;
  late StreamSubscription<Position> streamSubscription;

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }

  Future<bool> getLocation() async {
    try {
      bool serviceEnabled;

      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        return Future.error('Location service are disabled !');
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permission are denied !');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permission.');
      }

      streamSubscription =
          Geolocator.getPositionStream().listen((Position position) async {
        latitude.value = 'Latitude: ${position.latitude}';
        longitude.value = 'Longitude: ${position.longitude}';

        await getAddress(position);
        print(address);
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getAddress(Position position) async {
    try {
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemark[0];
      address.value =
          '${place.street}, ${place.name}, ${place.locality}, ${place.subAdministrativeArea}';
      // print(address.value);
    } catch (e) {
      print('Failed to get location');
    }
  }
}
