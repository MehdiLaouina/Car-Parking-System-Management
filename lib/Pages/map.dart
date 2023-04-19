import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:application/Widget/BottomSheet.dart';
import 'package:application/Widget/marker.dart';
// ignore: import_of_legacy_library_into_null_safe, depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.6),
              size: 20,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(33.996620, -4.991949),
              minZoom: 13.5,
              maxZoom: 18,
              zoom: 16,
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      "http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}",
                  subdomains: const ['mt0', 'mt1', 'mt2', 'mt3']),
              MarkerLayer(
                markers: [
                  Marker(
                      point: LatLng(33.997863, -4.994035),
                      builder: (context) {
                        return GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                            },
                            child:
                                const CustomMarker(Icons.local_parking, '100'));
                      }),
                  Marker(
                    width: 40,
                    height: 40,
                    point: LatLng(33.997311, -4.995229),
                    builder: (context) {
                      return const CustomMarker(Icons.local_parking, '34');
                    },
                  ),
                  Marker(
                      width: 40,
                      height: 40,
                      point: LatLng(33.995070, -4.991557),
                      builder: (context) {
                        return const CustomMarker(Icons.local_parking, '10');
                      }),
                  Marker(
                      width: 40,
                      height: 40,
                      point: LatLng(33.993700, -4.992673),
                      builder: (context) {
                        return const CustomMarker(Icons.local_parking, '16');
                      }),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 28, top: 100, right: 28, bottom: 10),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide.none,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  title: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: 'Where do you go?',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                            letterSpacing: 0.2)),
                  ),
                  trailing: Icon(
                    Icons.search,
                    size: 27,
                    color: Colors.deepPurple[400],
                  ),
                ),
              ),
            ),
          ),
          Visibility(visible: _visibility, child: const DraggableSheet()),
        ],
      ),
    );
  }

  bool _visibility = false;
  _showBottomSheet() {
    setState(() {
      _visibility = _visibility ? false : true;
    });
  }
}
