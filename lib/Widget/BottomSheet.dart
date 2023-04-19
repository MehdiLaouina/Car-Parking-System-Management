import 'package:flutter/material.dart';
import 'package:application/Transitions/SlideTransition.dart';
//import 'package:application/Pages/payment.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      maxChildSize: 0.65,
      minChildSize: 0.25,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.65,
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Container(
                        width: 44,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Perdo Garage',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 22.4,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              '235 Zemblak Crest Apt. 102',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 12,
                                  letterSpacing: 0.2),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                Card(
                                  color: Colors.grey[900],
                                  elevation: 4,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.local_parking,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  '24 spots',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.4),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                                Card(
                                  color: Colors.grey[900],
                                  elevation: 4,
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.attach_money,
                                      size: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  '10.44 p/h',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.4),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      /*Padding(
                          padding: const EdgeInsets.only(right: 18.0, top: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/garage.png',
                              fit: BoxFit.cover,
                              width: 120,
                              height: 110,
                            ),
                          ),
                        ),*/
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 24),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(6),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black87),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 14.0)),
                        ),
                        onPressed: () {
                          //Navigator.push(context,
                          //  SlideTopRoute(page: const MyPaymentPage()));
                        },
                        child: const Text(
                          'BOOK SPOT',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 4,
                              letterSpacing: 0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Working Hours',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 12,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      '05:00 AM - 11:00 PM',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 18,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Open Now',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                          fontSize: 12.4,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Contacts',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 12,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.call,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '886-445-7822',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[900],
                              fontSize: 18,
                              letterSpacing: 0.2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.web_asset,
                          size: 16,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'perdoGarage.co.us',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[900],
                              fontSize: 14.4,
                              letterSpacing: 0.2),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Full Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400],
                          fontSize: 12,
                          letterSpacing: 0.2),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Perdo Garage - 235 Bahringer Stravenue Suite 164 Colony Apt. 102',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900],
                          fontSize: 16.5,
                          letterSpacing: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
