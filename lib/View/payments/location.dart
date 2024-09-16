// import 'package:location/location.dart';

// class LocationHandler {
//   Location _location = Location();

//   bool _serviceEnabled = false;
//   late PermissionStatus _permissionGranted;
//   late LocationData _locationData;
//   Future<bool> checkServiceIfEnabled() async {
//     _serviceEnabled = await _location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await _location.requestService();
//       if (!_serviceEnabled) {
//         return false;
//       }
//       return true;
//     }
//     return true;
//   }

//   Future<bool> checkIfPermissionGranted() async {
//     _permissionGranted = await _location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await _location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return false;
//       }
//       return true;
//     }
//     return true;
//   }

//   Future<LocationData> getLocationData() async {
//     _locationData = await _location.getLocation();
//     return _locationData;
//   }
// }
