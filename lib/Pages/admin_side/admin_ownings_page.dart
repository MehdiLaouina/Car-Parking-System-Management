import 'package:application/models/map/markers_model.dart';
import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class AdminOwningsPage extends StatefulWidget {
  const AdminOwningsPage({super.key});

  @override
  State<AdminOwningsPage> createState() => _AdminOwningsPageState();
}

class _AdminOwningsPageState extends State<AdminOwningsPage> {
  List<MarkerModel> parkings = <MarkerModel>[];
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final parkingsModel = await APIService.getParkingDetail();

    setState(() => parkings = parkingsModel!.data.markers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: ListTile(
            title: const Text('Parking Details'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: parkings.length,
                  itemBuilder: (context, index) {
                    final parking = parkings[index];
                    return ListTile(
                      title: Text('Parking ID: ${parking.id_parking}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address: ${parking.adresse}'),
                          Text('Total Spots: ${parking.total_spots}'),
                          Text('Available Spots: ${parking.available_spots}'),
                          Text('Prix Spot: ${parking.Prix_spot}'),
                          Text('Open Time: ${parking.open_time}'),
                          Text('Close Time: ${parking.close_time}'),
                          Text('Longitude: ${parking.longitude}'),
                          Text('Latitude: ${parking.latitude}'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
