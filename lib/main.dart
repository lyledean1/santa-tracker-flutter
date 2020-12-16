import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LatLng cameraPosition = LatLng(0,0);

  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final santaLocations = await locations.getSantaDestinations();
    print(santaLocations.destinations[0].toJson());
    setState(() {
      _markers.clear();
      for (final dest in santaLocations.destinations) {
        final marker = Marker(
          markerId: MarkerId(dest.city),
          position: LatLng(dest.location.lat, dest.location.lng),
          infoWindow: InfoWindow(
            title: dest.city,
            snippet: dest.region,
          ),
        );
        _markers[dest.city] = marker;
      }
      cameraPosition = LatLng(santaLocations.destinations[0].location.lat,santaLocations.destinations[0].location.lng);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Santa Tracker'),
          backgroundColor: Colors.redAccent,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: cameraPosition,
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}