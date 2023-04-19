import 'package:flutter/material.dart';

import '../../models/client/Client.dart';

class ClientSettingsPage extends StatelessWidget {
  final Client client;

  const ClientSettingsPage({super.key, required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text('Settings'),
      ),
      body: Center(
        child: Text('Name: ${client.data.name}, Email: ${client.data.email}'),
      ),
    );
  }
}
