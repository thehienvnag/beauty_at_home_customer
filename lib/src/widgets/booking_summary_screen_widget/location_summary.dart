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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xff0A8988),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.72,
          margin: EdgeInsets.only(left: 10),
          // width: 280,
          child: Text(this.address),
        )
      ],
    );
  }
}
