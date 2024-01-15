import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentPosition = LatLng(25.704844972355435, 88.6558681679283);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _mapController;

  final Map<String, Marker> _markers = {};

  addMarkers(String id, LatLng location) async{
    //format image from assets
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        'assets/images/logo.jpeg');
    //format image from url
    String url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7XX_miW59XuEXCeuJaNX7-aqMU3brrfibesUJKg2hL_rhOC9oQf05jcq3ZsBOLH2l1mk&usqp=CAU';
    Uint8List bytes = (await NetworkAssetBundle(Uri.parse(url))
        .load(url))
        .buffer
        .asUint8List();
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: const InfoWindow(
        title: 'Title name here',
        snippet: 'Description here',
      ),
      // icon: markerIcon,
      icon: BitmapDescriptor.fromBytes(bytes),
    );

    _markers[id] = marker;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition:
            const CameraPosition(target: currentPosition, zoom: 14),
        onMapCreated: (controller) {
          _mapController = controller;
          addMarkers('test', currentPosition);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }
}
