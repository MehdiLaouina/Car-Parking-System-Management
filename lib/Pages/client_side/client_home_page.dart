import 'package:application/Pages/client_side/client_side_menu.dart';
import 'package:application/Pages/map.dart';
import 'package:flutter/material.dart';
import 'package:application/Paint/CustomPaintHome.dart';
import 'package:application/Transitions/FadeTransition.dart';

import '../../models/client/Client.dart';
import '../../services/api_service.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  Client currentClient = Client(
      message: "",
      data: Data(
          id: 0,
          name: "",
          email: "",
          vehicule: "",
          N_immatriculation: "",
          solde: 0,
          methodePayement: ""));

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final Client finalClient = (await APIService.getClientProfile()) as Client;

    setState(() => currentClient = finalClient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClientSideMenu(client: currentClient),
      body: Stack(
        children: <Widget>[
          const TopBar_home(),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Builder(
                    builder: (context) {
                      return GestureDetector(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white.withOpacity(0.9),
                          size: 26,
                        ),
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
                title: const Center(
                  child: Text(
                    'Park My Car',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quickstand'),
                  ),
                ),
                actions: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                  ),
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 28, top: 40, right: 28, bottom: 10),
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
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, FadeRoute(page: const MapView()));
                      },
                      child: Icon(
                        Icons.search,
                        size: 27,
                        color: Colors.deepPurple[400],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
