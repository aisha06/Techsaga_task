import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controller/fitnessImagesController.dart';
import 'models/fitnessImageModel.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  ApiService apiCtrl = ApiService();
  final LatLng _center = const LatLng(28.583745, 77.3155413); // San Francisco

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late Future<FitnesImages> _fitnessImages;
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // Set<Marker> markers = const <Marker>{};
  List<Marker> markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    _fitnessImages = ApiService().fetchFitnesImages(28.583745, 77.3155413);
    getData();
  }

  void getData() {
    _fitnessImages.then((value) {
      for (var element in value.cityList) {
        Marker markerData = Marker(
          markerId: MarkerId("1"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(element.geoLatitude, element.geoLongitude),
          infoWindow: InfoWindow(title: element.cityName, snippet: '*'),
        );
        setState(() {});
        print('vaishanvi.....${markerData}');

        markers.add(markerData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('vaishanvisssssss......${markers}');

    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          mapType: MapType.normal,
          markers: Set<Marker>.of(markers),
        ),
      ),
    );
  }
}
