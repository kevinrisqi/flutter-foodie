import 'dart:async';

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

  void getLocation() async {
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
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'Latitude: ${position.latitude}';
      longitude.value = 'Longitude: ${position.longitude}';

      getAddress(position);
    });
  }

  Future<void> getAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value =
        '${place.street}, ${place.name}, ${place.locality}, ${place.subAdministrativeArea}';
  }
}
