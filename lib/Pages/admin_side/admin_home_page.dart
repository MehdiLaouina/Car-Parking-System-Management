import 'package:application/models/admin/Admin.dart';
import 'package:flutter/material.dart';

import '../../services/api_service.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late APIService apiService = APIService();
  Admin admin = Admin(message: "", data: Data(id: 0, name: "", email: ""));

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final Admin finalAdmin = (await APIService.getAdminProfile()) as Admin;

    setState(() => admin = finalAdmin);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
