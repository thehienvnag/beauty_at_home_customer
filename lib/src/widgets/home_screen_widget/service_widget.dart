import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  final String image;
  final Function press;
  const ServiceWidget({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('public/img/iconnail.PNG'),
                  ),
                ),
              ),
              Text('Làm nail'),
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('public/img/icontoc.PNG'),
                  ),
                ),
              ),
              Text('Làm tóc'),
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('public/img/iconmakeup.PNG'),
                  ),
                ),
              ),
              Text('Makeup'),
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('public/img/iconnoimi.PNG'),
                  ),
                ),
              ),
              Text('Nối mi')
            ],
          ),
          Column(
            children: [
              Container(
                height: 70,
                width: 57,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.6),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('public/img/iconmassage.PNG'),
                  ),
                ),
              ),
              Text(
                'Massage',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
