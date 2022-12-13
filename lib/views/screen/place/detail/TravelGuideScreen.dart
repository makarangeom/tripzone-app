import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelGuideScreen extends StatefulWidget {
  const TravelGuideScreen({ Key? key }) : super(key: key);

  @override
  _TravelGuideScreenState createState() => _TravelGuideScreenState();
}

class _TravelGuideScreenState extends State<TravelGuideScreen> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
      children: <Widget>[
      GoogleMap(initialCameraPosition: CameraPosition(target:
      LatLng(-33.870840,151.206286),
        zoom: 12)
    )
    ],
        )
      ),
    );
  }
}