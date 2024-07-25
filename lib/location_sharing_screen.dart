import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationSharingScreen extends StatefulWidget {
  @override
  _LocationSharingScreenState createState() => _LocationSharingScreenState();
}

class _LocationSharingScreenState extends State<LocationSharingScreen> {
  Location _location = Location();
  GoogleMapController? _controller;
  LatLng _currentPosition = LatLng(0.0, 0.0);
  bool _isSharing = false;

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged.listen((LocationData currentLocation) {
      _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      _controller?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 17.0,
        ),
      ));
      if (_isSharing) {
        // Implement your logic to share the location data
      }
    });
  }

  void _toggleLocationSharing(bool value) {
    setState(() {
      _isSharing = value;
    });
    // Add logic to handle start/stop of location sharing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            markers: {
              Marker(
                markerId: MarkerId("current_location"),
                position: _currentPosition,
              ),
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            top: 50,
            right: 10,
            child: FloatingActionButton(
              onPressed: () => _toggleLocationSharing(!_isSharing),
              child: Icon(_isSharing ? Icons.location_off : Icons.location_on),
              backgroundColor: _isSharing ? Colors.red : Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
