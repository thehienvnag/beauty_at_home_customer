import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          children: [
            Text(
              'Chọn phương thức thanh toán',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Divider(
              height: 8,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 220),
            child: Row(
              children: [
                Container(
                  child: Text('Powered By'),
                ),
                Text(
                  ' MOMO',
                  style: TextStyle(color: Colors.pink),
                )
              ],
            ),
          ),
          Divider(
            height: 25,
            thickness: 0.5,
            color: Colors.grey,
            indent: 12,
            endIndent: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, 0);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(
                      'public/img/momo_icon.png',
                    ),
                    height: 38,
                    width: 38,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: Text('MoMo'),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 20,
            thickness: 0.5,
            color: Colors.grey,
            indent: 10,
            endIndent: 12,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, 1);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/iconcash.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Tiền mặt'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
          ),
          Divider(
            height: 20,
            thickness: 0.5,
            color: Colors.grey,
            indent: 12,
            endIndent: 10,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('public/img/iconatm.PNG'),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6454',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'This payment method can’t be used in this country.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 20,
            thickness: 0.5,
            color: Colors.grey,
            indent: 12,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
