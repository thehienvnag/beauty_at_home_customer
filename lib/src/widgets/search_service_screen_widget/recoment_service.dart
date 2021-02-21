import 'package:flutter/material.dart';

class RecomendServices extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget myDetailsContainer1() {
      Size size = MediaQuery.of(context).size;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.2,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('public/img/beautician1.png'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10,top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        'Hani Nguyễn',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      //margin: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFCC00),
                          ),
                          Text('5')
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'Làm nail - Làm tóc',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '2.3 km',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    Text(
                      ' | Quận 2,3 , TP. Hồ Chí Minh',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xff28BEBA) ),
                    ),
                    Text(
                      ' - 9:00 AM - 8:30 PM',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    Widget myDetailsContainer2() {
      Size size = MediaQuery.of(context).size;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.2,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('public/img/beautician2.png'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10,top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        'Tony Đặng',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFCC00),
                          ),
                          Text('4.8')
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'Massage - Giác hơi',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '5 km',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    Text(
                      ' | Quận 1, TP. Hồ Chí Minh',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xff28BEBA)),
                    ),
                    Text(
                      ' - 9:00 AM - 8:30 PM',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    Widget myDetailsContainer3() {
      Size size = MediaQuery.of(context).size;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.2,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('public/img/beautician3.png'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10,top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        'Marry Trần',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      //margin: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFCC00),
                          ),
                          Text('4.8')
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'Trang điểm - Làm tóc',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '5 km',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    Text(
                      ' | Quận 1, TP. Hồ Chí Minh',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xff28BEBA)),
                    ),
                    Text(
                      ' - 9:00 AM - 8:30 PM',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    Widget myDetailsContainer4() {
      Size size = MediaQuery.of(context).size;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.2,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('public/img/logo.png'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10,top: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 200,
                      child: Text(
                        'Aleck Marry',
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffFFCC00),
                          ),
                          Text('4.8')
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'Combo Làm tóc, trang điểm',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '4.3 km',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    Text(
                      ' | Quận 10, TP. Hồ Chí Minh',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xff28BEBA)),
                    ),
                    Text(
                      ' - 9:00 AM - 8:30 PM',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    return  Column(
      children: [
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer1()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer2()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer3()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer4()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer1()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer2()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer3()),
        Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 0.5,
                )),
            child: myDetailsContainer4()),
      ],
    );
  }
  
}
