import 'dart:async';

import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/loginpage.dart';
import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/qrscanner.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'loginreal.dart';

const LatLng currentLocation =
    LatLng(9.939093, 76.270523); //global position initial camera positions

class Homepagemain extends StatefulWidget {
  const Homepagemain({super.key});

  @override
  State<Homepagemain> createState() => _HomepagemainState();
}

class _HomepagemainState extends State<Homepagemain> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late GoogleMapController _mapController;
  Completer<GoogleMapController> _controller = Completer();

  static final Marker _kGoogleplexMarker = Marker(
      markerId: MarkerId("_KGoogleplex"),
      infoWindow: InfoWindow(title: "Stations"),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(10.05506, 76.22649));
  static final CameraPosition _kGoogleplex =
      CameraPosition(target: LatLng(9.9950339, 76.2246941), zoom: 14);
  static final CameraPosition _Station = CameraPosition(
      target: LatLng(10.05506, 76.22649),
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  static final CameraPosition _Station2 = CameraPosition(
      target: LatLng(10.0235, 76.22649),
      bearing: 192.8334901395799,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


        static final Marker _kGoogleplexMarker2 = Marker(
      markerId: MarkerId("_KGoogleplex"),
      infoWindow: InfoWindow(title: "Stations"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(10.0050,76.2217));

      static final Polyline _kpolyLine = Polyline(polylineId: PolylineId('_KployLine'),points:[LatLng(10.05506, 76.22649),LatLng(10.05506, 76.22649)], width:5,  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _gotoStation,
        backgroundColor: Colors.purple,
        label: Text(
          "Find nearby stations",
        ),
        icon: Icon(Icons.bike_scooter),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'payment'),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        )
      ]),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
        actions: [
          TextButton(
              onPressed: () async {
                auth.signOut();
                Get.offAll(() => LoginScreen());
              },
              child: Text('Logout')),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRScan(),
                    ));
              },
              icon: Icon(Icons.qr_code))
        ],
        title: Text('Cyclo Rental'),
      ),
      body: GoogleMap(
        polylines: {_kpolyLine},
          markers: {_kGoogleplexMarker,_kGoogleplexMarker2},
          mapType: MapType.normal,
          initialCameraPosition: _kGoogleplex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      // initialCameraPosition: const CameraPosition(
      //   target: currentLocation,
      //   zoom: 14,
    );
    //       onMapCreated: (controller) {
    //         _mapController = controller;
    //         addMarker("test", currentLocation);
    //       },
    //       markers: _markers.values.toSet(),
    //     ),
    //   );
    // }

    // addMarker(String id, LatLng location) {
    //   var marker = Marker(
    //       markerId: MarkerId(id),
    //       position: location,
    //       infoWindow:
    //           const InfoWindow(title: "Place Name", snippet: "Description"));
    //   _markers[id] = marker;
    //   setState(() {});
  }

  void _gotoStation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_Station));
  }
}
