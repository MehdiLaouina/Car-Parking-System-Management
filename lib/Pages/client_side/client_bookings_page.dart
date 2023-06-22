import 'package:flutter/material.dart';

import '../../models/client/Client.dart';
import '../../services/api_service.dart';

class ClientBookingsPage extends StatefulWidget {
  const ClientBookingsPage({super.key});

  @override
  State<ClientBookingsPage> createState() => _ClientBookingsPageState();
}

class _ClientBookingsPageState extends State<ClientBookingsPage> {
  // List<ReservationModel> parkings = <ReservationModel>[];
  // @override
  // void initState() {
  //   super.initState();
  //   init();
  // }

  // Future init() async {
  //   final parkingsModel = await APIService.getReservationDetail();

  //   setState(() => parkings = parkingsModel!.data.markers);
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
