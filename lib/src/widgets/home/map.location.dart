import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapLocation extends StatefulWidget {
  const MapLocation({super.key});

  @override
  State<MapLocation> createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static const CameraPosition home = CameraPosition(
    target: LatLng(45.2533134746167, 19.795796484559),
    zoom: 14.4746,
  );

  final marker = Marker(
    markerId: const MarkerId('home'),
    zIndex: 41,
    position: const LatLng(45.2533134746167, 19.795796484559),
    icon: BitmapDescriptor.defaultMarkerWithHue(1),
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      markers[const MarkerId('home')] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: home,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.values.toSet(),
        myLocationEnabled: true,
      ),
    );
  }
}
