import 'package:flutter/material.dart';

class BeauticianWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image(
                image: AssetImage(
                  'public/img/icon2.PNG',
                ),
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            Text(
              'THỢ CHUYÊN NGHIỆP',
              style: TextStyle(
                  letterSpacing: 1,
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ],
        ),
        Beautician(
          image: "public/img/beautician1.PNG",
          press: () {},
        ),
        Divider(
          height: 20,
          thickness: 0.5,
          color: Colors.grey,
          indent: 12,
          endIndent: 12,
        ),
        Beautician(
          image: "public/img/beautician2.PNG",
          press: () {},
        ),
        Divider(
          height: 20,
          thickness: 0.5,
          color: Colors.grey,
          indent: 12,
          endIndent: 12,
        ),
        Beautician(
          image: "public/img/beautician3.PNG",
          press: () {},
        ),
        Divider(
          height: 20,
          thickness: 0.5,
          color: Colors.grey,
          indent: 12,
          endIndent: 12,
        ),
        Beautician(
          image: "public/img/beautician2.PNG",
          press: () {},
        ),
        Divider(
          height: 20,
          thickness: 0.5,
          color: Colors.grey,
          indent: 12,
          endIndent: 12,
        )
      ],
    );
  }
}

class Beautician extends StatelessWidget {
  final String image;
  final Function press;
  const Beautician({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 13),
              width: size.width * 0.2,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.2),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Marry Trần',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black),
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
                            color: Colors.blue),
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
            Container(
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
      ),
    );
  }
}
