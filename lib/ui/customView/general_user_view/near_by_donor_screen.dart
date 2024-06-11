import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../utils/helper_funtion.dart';

class NearByDonorScreen extends StatefulWidget {
  const NearByDonorScreen({super.key});

  @override
  _NearByDonorScreenState createState() => _NearByDonorScreenState();
}

class _NearByDonorScreenState extends State<NearByDonorScreen> {
  GoogleMapController? _controller;
  List<Location> locations = [
    Location(latitude: 23.8045, longitude: 90.5055), // Example locations
    Location(latitude: 23.8046, longitude: 90.6057),
    Location(latitude: 23.8047, longitude: 90.7060),
  ];
  Set<Marker> markers = {};


  @override
  void initState() {
    _setCurrentPosition().then((value)  => _setMarkers());
    super.initState();
  }


  Future<void> _setCurrentPosition()async{

  }


  Future<void> _setMarkers() async {
    print("this is my location: "+currentPosition.toString());

    double radius = 464163; // 5km in meters

    for (var location in locations) {
      double distance = Geolocator.distanceBetween(
        currentPosition!.latitude,
        currentPosition!.longitude,
        location.latitude,
        location.longitude,
      );

      print("this is distance: "+distance.toString());

      if (distance <= radius) {
        markers.add(
          Marker(
            markerId: MarkerId(location.latitude.toString() + location.longitude.toString()),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: 'Location'),
          ),
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLocationGranted ? GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(currentPosition!.latitude , currentPosition!.longitude),
          zoom: 15,
        ),
        markers: markers,
        mapType: MapType.hybrid,
        mapToolbarEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ) : Center(
        child: Text('Location permission is required to use this feature.'),
    ),
    );
  }
}


class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});
}
