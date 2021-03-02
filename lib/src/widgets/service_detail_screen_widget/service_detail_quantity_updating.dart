import 'package:flutter/material.dart';

class ServiceDetailQuantityUpdating extends StatefulWidget {
  @override
  _ServiceDetailQuantityUpdatingState createState() => _ServiceDetailQuantityUpdatingState();
}

class _ServiceDetailQuantityUpdatingState extends State<ServiceDetailQuantityUpdating> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.1,
      width: screenSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 45.0 * 0.9,
            width: 45.0 * 0.9,
            margin: EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(color: Colors.grey),
                ],
            ),
            child: IconButton(icon: Icon(Icons.remove, color: Color(0xff28BEBA),), onPressed: () {
              setState(() {
                if (quantity > 0) {
                  quantity--;
                }
              });
            }),
          ),
          Container(child: Text(quantity.toString(),
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),)),
          Container(
            height: 45.0 * 0.9,
            width: 45.0 * 0.9,
            margin: EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(color: Colors.grey),
              ],
            ),
            child: IconButton(icon: Icon(Icons.add, color: Color(0xff28BEBA),), onPressed: () {
              setState(() {
                if (quantity < 99) {
                  quantity++;
                }
              });
            }),
          )
        ],
      ),
    );
  }
}
