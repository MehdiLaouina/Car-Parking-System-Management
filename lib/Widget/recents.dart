import 'package:flutter/material.dart';
import 'package:application/Widget/Rating.dart';
//import 'package:application/helper/fake_data.dart';

class Recents extends StatefulWidget {
  const Recents({super.key});

  @override
  State createState() => _RecentState();
}

class _RecentState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          //itemCount: recentList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 6,
                  color: Colors.black.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      children: <Widget>[
                        const ListTile(
                            /*title: Text(
                            '${recentList[index].title}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.5,
                                letterSpacing: 0.2),
                          ),*/
                            /*subtitle: Text(
                            '${recentList[index].subtitle}',
                            style: const TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.5,
                                letterSpacing: 0.1),
                          ),*/
                            ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: StarRating(
                                  size: 20,
                                  color: Colors.yellow,
                                  //rating: recentList[index].rating,
                                  onRatingChanged: (double rating) {},
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                //child: Text(
                                //'\u20B9 ${recentList[index].price}',
                                //style: const TextStyle(
                                //    color: Colors.white,
                                //   fontWeight: FontWeight.w800,
                                // fontSize: 17),
                                //),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
