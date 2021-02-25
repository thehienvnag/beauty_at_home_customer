import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class BeauticianRouteMap extends StatefulWidget {
  @override
  _BeauticianRouteMapState createState() => _BeauticianRouteMapState();
}

class _BeauticianRouteMapState extends State<BeauticianRouteMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(10.8414098, 106.8234879),
        zoom: 15,
        maxZoom: 15,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png",
        ),
        MarkerLayerOptions(markers: [
          Marker(
            point: LatLng(10.8414098, 106.8234879),
            builder: (ctx) => Icon(
              Icons.pedal_bike,
              color: Colors.blue,
              size: 20.0,
            ),
            height: 60,
          ),
        ]),
      ],
    );
  }
}
