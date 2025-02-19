import 'package:ai_weather/core/utils/app_strings.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<String?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception(AppStrings.errorLocationService);
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception(AppStrings.errorLocationService);
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(AppStrings.errorPermission);
      }

      // Get Current Position
      Position location = await Geolocator.getCurrentPosition();

      // Get Place Details
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      Placemark place;
      if (placeMarks.isNotEmpty) {
        place = placeMarks.first;
      } else {
        throw Exception(AppStrings.noPlacemark);
      }
      return place.country ?? 'cairo';
    } catch (e) {
      return null;
    }
  }
}
