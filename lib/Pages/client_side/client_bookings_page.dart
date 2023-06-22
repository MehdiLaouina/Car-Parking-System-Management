import 'package:flutter/material.dart';

import '../../models/reservation/reservation_model.dart';
import '../../services/api_service.dart';

class ClientBookingsPage extends StatefulWidget {
  const ClientBookingsPage({super.key});

  @override
  State<ClientBookingsPage> createState() => _ClientBookingsPageState();
}

class _ClientBookingsPageState extends State<ClientBookingsPage> {
  List<ReservationModel> reservations = <ReservationModel>[];
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final reservationsModel = await APIService.getReservationDetail();

    setState(() => reservations = reservationsModel!.data.reservations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: ListTile(
            title: const Text('Reservations Details'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    final res = reservations[index];
                    return ListTile(
                      title: Text('Reservation ID: ${res.Id_reservation}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rate : ${res.Rate}'),
                          Text('Entry_date : ${res.Entry_date}'),
                          Text('Exit_date : ${res.Exit_date}'),
                          Text('Status_paiement : ${res.Status_paiement}'),
                          Text('Id_facture : ${res.Id_facture}'),
                          Text('Id_spot : ${res.Id_spot}'),
                          Text('Id_admin: ${res.Id_admin}'),
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
