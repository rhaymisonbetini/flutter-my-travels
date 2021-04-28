import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Map extends StatefulWidget {
  @override
  _Map createState() => _Map();
}

class _Map extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {};

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _exibirMarcador(LatLng latLng) {
    Marker marker = Marker(
      markerId: MarkerId('${latLng.latitude}'),
      position: latLng,
      infoWindow: InfoWindow(title: "Marcador"),
    );

    setState(() {
      _markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecione o lugaro no mapa!')),
      body: Container(
        child: GoogleMap(
          markers: _markers,
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(-23.562436, -46.655005), zoom: 18),
          onMapCreated: _onMapCreated,
          onLongPress: _exibirMarcador,
        ),
      ),
    );
  }
}
