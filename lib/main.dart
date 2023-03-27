import 'package:application/Pages/default_page.dart';
import 'package:application/Pages/login_page.dart';
import 'package:flutter/material.dart';

import 'Pages/admin_login_page.dart';
import 'Pages/admin_register_page.dart';
import 'Pages/home_page.dart';
import 'Pages/register_page.dart';

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
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/admin-login': (context) => const AdminLoginPage(),
        '/admin-register': (context) => const AdminRegisterPage(),
      },
    );
  }
}
