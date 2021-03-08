import 'package:flutter/material.dart';

class ServiceDetailDescription extends StatelessWidget {
  final String name;
  final String note;
  final String price;

  const ServiceDetailDescription(
      {Key key, this.name, this.note, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[200], offset: Offset(0.0, 8.0))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.7,
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: Text(
                  '$priceđ',
                  style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              note,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
