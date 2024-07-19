import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(Konum());
}

class Konum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng firstLocation = LatLng(37.7749, -122.4194); // Örnek konum 1
  final LatLng secondLocation = LatLng(40.7128, -74.0060); // Örnek konum 2

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('firstLocation'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(title: 'İlk Konum'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ),
    Marker(
      markerId: MarkerId('secondLocation'),
      position: LatLng(40.7128, -74.0060),
      infoWindow: InfoWindow(title: 'İkinci Konum'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Haritalar'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: firstLocation,
          zoom: 10.0,
        ),
        markers: markers,
      ),
    );
  }
}
