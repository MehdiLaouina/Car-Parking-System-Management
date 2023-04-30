import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomMarker extends StatelessWidget {
  final IconData _icon;
  final int _space;

  const CustomMarker(this._icon, this._space, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Padding(
            padding: EdgeInsets.only(top: 26),
            child: Center(
                child: Icon(
              Icons.location_on,
              color: Colors.white,
            ))),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4.4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                _icon,
                size: 13.4,
                color: Colors.grey[800],
              ),
              Text(
                '$_space',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        )
      ],
    );
  }
}
