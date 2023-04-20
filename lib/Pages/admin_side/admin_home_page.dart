import 'package:application/Pages/admin_side/admin_side_menu.dart';
import 'package:application/models/admin/Admin.dart';
import 'package:flutter/material.dart';

import '../../Paint/CustomPaintHome.dart';
import '../../Transitions/FadeTransition.dart';
import '../../services/api_service.dart';
import '../map.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late APIService apiService = APIService();
  Admin currentAdmin =
      Admin(message: "", data: Data(id: 0, name: "", email: ""));

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final Admin finalAdmin = (await APIService.getAdminProfile()) as Admin;

    setState(() => currentAdmin = finalAdmin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideMenu(admin: currentAdmin),
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
