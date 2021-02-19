import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Inherited widget (page scope)
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.pin_drop,
              color: Color(0xff0DB5B4),
            ),
            Text(
              'Ho Chi Minh city',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('public/img/avatar.jpg'),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
          ),
          Container(
            height: 47,
            width: 360,
            color: Colors.white,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Tìm kiếm dịch vụ...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
