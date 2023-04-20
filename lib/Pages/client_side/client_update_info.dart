import 'package:flutter/material.dart';

import '../../models/client/Client.dart';

class ClientUpdateInfo extends StatefulWidget {
  final Client client;
  const ClientUpdateInfo({super.key, required this.client});

  @override
  State<ClientUpdateInfo> createState() => _ClientUpdateInfoState();
}

class _ClientUpdateInfoState extends State<ClientUpdateInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
