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
    return Padding(
      padding: const EdgeInsets.only(bottom: 250),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(10.7233122, 107.3944394),
          zoom: 15.0,
        ),
        layers: [
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(10.7233122, 107.3944394),
                builder: (ctx) => Container(
                  child: FlutterLogo(),
                ),
              ),
            ],
          ),
        ],
        // children: <Widget>[
        //   TileLayerWidget(
        //       options: TileLayerOptions(
        //           urlTemplate:
        //               "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        //           subdomains: ['a', 'b', 'c'])),
        //   MarkerLayerWidget(
        //       options: MarkerLayerOptions(
        //     markers: [
        //       Marker(
        //         width: 15.0,
        //         height: 15.0,
        //         point: LatLng(10.7233122, 107.3944394),
        //         builder: (ctx) => Container(
        //           child: FlutterLogo(),
        //         ),
        //       ),
        //     ],
        //   )),
        // ],
      ),
    );
  }
}
