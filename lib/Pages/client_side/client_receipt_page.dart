import 'package:flutter/material.dart';

class MyRecipt extends StatefulWidget {
  @override
  State createState() => _MyReciptState();
}

class _MyReciptState extends State<MyRecipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context, true);
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Colors.black,
                          size: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      const Center(
                        child: Text(
                          'Parking Code',
                          style: TextStyle(
                              fontSize: 24.4,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/qr_code.jpg',
                      width: 220,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Parking Pass',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400],
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              '#12-51-65',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Parking Slot',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400],
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'F1-B4',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 32),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'From',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400],
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              '10:00 AM',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'To',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[400],
                                  fontSize: 13),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              '14:00 PM',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Full Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 13,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Car Parking Garage - 123 Trik Mouzar Fes 30400',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 16.4,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 144,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 6,
                            backgroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'DIRECTION',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 2,
                              letterSpacing: 0.4,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
