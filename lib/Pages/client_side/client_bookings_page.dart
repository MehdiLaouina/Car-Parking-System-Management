import 'package:flutter/material.dart';

import '../../models/client/Client.dart';

class ClientBookingsPage extends StatefulWidget {
  final Client client;
  const ClientBookingsPage({super.key, required this.client});

  @override
  State<ClientBookingsPage> createState() => _ClientBookingsPageState();
}

class _ClientBookingsPageState extends State<ClientBookingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
