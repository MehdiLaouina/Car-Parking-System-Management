import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:application/Widget/BottomSheet.dart';
import 'package:application/Widget/marker.dart';
// ignore: import_of_legacy_library_into_null_safe, depend_on_referenced_packages
import 'package:latlong2/latlong.dart';

import '../services/api_service.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {}

  Future<List<Marker>> getMarkers() async {
    final parkingsModel = await APIService.getMap();

    final markers = <Marker>[];

    if (parkingsModel != null) {
      for (final item in parkingsModel.data.markers) {
        final latitude = item.latitude;
        final longitude = item.longitude;
        final totalSpots = item.total_spots;

        final marker = Marker(
          width: 40,
          height: 40,
          point: LatLng(latitude, longitude),
          builder: (context) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  index = item.id_parking;
                });
                _showBottomSheet();
              },
              child: CustomMarker(Icons.local_parking, totalSpots),
            );
          },
        );

        markers.add(marker);
      }
      return markers;
    } else {
      throw Exception('Failed to fetch markers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
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
            FutureBuilder<List<Marker>>(
                future: getMarkers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FlutterMap(
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
                          markers: snapshot.data!,
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
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
            Visibility(
                visible: _visibility, child: DraggableSheet(index: index)),
          ],
        ),
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
