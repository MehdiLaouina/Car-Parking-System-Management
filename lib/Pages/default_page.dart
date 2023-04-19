import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultHome extends StatefulWidget {
  const DefaultHome({super.key});

  @override
  State<DefaultHome> createState() => _DefaultHomeState();
}

class _DefaultHomeState extends State<DefaultHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: bodyUI(context),
      ),
    );
  }

  //bodyUI
  Widget bodyUI(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 50),
        Image.asset(
          'assets/images/App_Logo.png',
          height: 160,
          width: 160,
        ),
        const SizedBox(height: 50),
        //Hello Again!
        SizedBox(
          width: 250, // or any width that works for your design
          child: Center(
            child: Text(
              "Park My Car!",
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Select User Type",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 50),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('I am :',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                  )),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/admin-login');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Owner'),
              ),
              const SizedBox(height: 12),
              Text('Or',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                  )),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Client'),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
