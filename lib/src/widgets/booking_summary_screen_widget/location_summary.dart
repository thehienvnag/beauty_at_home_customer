import 'package:flutter/material.dart';

class LocationSummary<T> extends StatelessWidget {
  final String address;
  const LocationSummary({
    Key key,
    this.address,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xff0A8988),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Text(this.address),
        )
      ],
    );
  }
}
