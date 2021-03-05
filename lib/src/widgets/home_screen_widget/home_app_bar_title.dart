import 'package:flutter/material.dart';

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on,
          color: Color(0xff0DB5B4),
        ),
        Text(
          ' Hồ Chí Minh',
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
