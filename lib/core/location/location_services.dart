import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<String?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permissions are permanently denied.');
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
        // print('Country: ${place.country}');
        // print('Region: ${place.administrativeArea}');
      } else {
        throw Exception('No placemark found.');
      }
      return place.country ?? 'cairo';
    } catch (e) {
      print('Error getting location: $e');
    }
    return null;
  }
}
