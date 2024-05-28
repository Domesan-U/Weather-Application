import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<dynamic> GetCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      return position;
    }

    catch (e) {
      print(e);
      return null;
    }
  }
}
// last code Position position = await Future.any([Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low),Future.delayed(Duration(seconds:5),() => null)],);
//
// position = await Future.any([
// Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low),
// Future.delayed(Duration(seconds: 5), () => null),
// ]);
// if (postion == null) {
// position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
// }