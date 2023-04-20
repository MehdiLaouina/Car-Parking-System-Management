import 'package:application/Pages/default_page.dart';
import 'package:application/Pages/client_side/login_page.dart';
import 'package:flutter/material.dart';

import 'Pages/admin_side/admin_home_page.dart';
import 'Pages/admin_side/admin_login_page.dart';
import 'Pages/admin_side/admin_register_page.dart';
import 'Pages/client_side/client_home_page.dart';
import 'Pages/client_side/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Widget Root
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park My Car',
      debugShowCheckedModeBanner: false,
      initialRoute: '/default',
      routes: {
        '/default': (context) => const DefaultHome(),
        '/home': (context) => const ClientHomePage(),
        '/admin-home': (context) => const AdminHomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/admin-login': (context) => const AdminLoginPage(),
        '/admin-register': (context) => const AdminRegisterPage(),
      },
    );
  }
}
