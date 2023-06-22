import 'package:flutter/material.dart';
import '/Transitions/ScaleTransition.dart';
import 'client_receipt_page.dart';

class MyPaymentPage extends StatefulWidget {
  @override
  State createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
  final List _paymentMethod = [
    'Google Pay',
    'CIH',
    'Banque Populaire',
    'Attijari WaFa Banque'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
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
                  height: 24,
                ),
                const Text(
                  'Car Parking Garage',
                  style: TextStyle(
                    fontSize: 34.4,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '123 Trik Mouzar Fes',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(
                  height: 74,
                ),
                Text(
                  'Parking Time',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                      fontSize: 12.4),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 104,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SizedBox(
                              width: 134,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${index + 1} hours',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            letterSpacing: 0.1),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '${index * 5 + 1.5} dh',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[500]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  'Custom Range .',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.4,
                      color: Colors.grey[800],
                      letterSpacing: 0.2),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Payment Type',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                      fontSize: 12.4),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 104,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SizedBox(
                              width: 134,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${_paymentMethod[index]}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            letterSpacing: 0.1),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        '$index% GST',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[500]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Total : ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.4,
                            letterSpacing: 0.2),
                      ),
                      Text(
                        '20 dh',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
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
                        onPressed: () {
                          Navigator.push(context, ScaleRoute(page: MyRecipt()));
                        },
                        child: const Text(
                          'PAY NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            wordSpacing: 4,
                            letterSpacing: 0.3,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
