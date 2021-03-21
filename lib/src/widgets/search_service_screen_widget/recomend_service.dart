import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';

class ServiceItem {
  final String image;
  final String salonOwner;
  final String titleService;
  final double rate;
  final String area;
  final String timeLine;
  final String price;
  String range;
  String status;

  ServiceItem({
    this.image,
    this.salonOwner,
    this.titleService,
    this.rate,
    this.area,
    this.timeLine,
    this.status,
    this.range,
    this.price,
  });
}

class LoadServices extends StatelessWidget {
  List<ServiceItem> lstService = List.from([
    ServiceItem(
        image: 'public/img/mit_nails_spa.png',
        salonOwner: 'Mít Nail & Spa',
        titleService: 'Làm nail - Làm tóc',
        area: 'Quận 2, TP. Hồ Chí Minh',
        range: '2.3 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician2.png',
        salonOwner: 'Tony Đặng',
        titleService: 'Massage - Giác hơi',
        area: 'Quận 1, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician3.png',
        salonOwner: 'Marry Trần',
        titleService: 'Trang điểm - Làm tóc',
        area: 'Quận 10, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician1.PNG',
        salonOwner: 'Aleck Marry',
        titleService: 'Combo làm tóc,trang điểm',
        area: 'Quận 2, TP. Hồ Chí Minh',
        range: '2.3 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician2.png',
        salonOwner: 'Tony Đặng',
        titleService: 'Massage - Giác hơi',
        area: 'Quận 1, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician1.PNG',
        salonOwner: 'Hani Nguyễn',
        titleService: 'Làm nail - Làm tóc',
        area: 'Quận 2, TP. Hồ Chí Minh',
        range: '2.3 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician2.png',
        salonOwner: 'Tony Đặng',
        titleService: 'Massage - Giác hơi',
        area: 'Quận 1, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician3.png',
        salonOwner: 'Marry Trần',
        titleService: 'Trang điểm - Làm tóc',
        area: 'Quận 10, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician1.PNG',
        salonOwner: 'Aleck Marry',
        titleService: 'Combo làm tóc,trang điểm',
        area: 'Quận 2, TP. Hồ Chí Minh',
        range: '2.3 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
    ServiceItem(
        image: 'public/img/beautician2.png',
        salonOwner: 'Tony Đặng',
        titleService: 'Massage - Giác hơi',
        area: 'Quận 1, TP. Hồ Chí Minh',
        range: '5 km',
        rate: 4.8,
        timeLine: '9:00 AM - 8:30 PM',
        status: 'Đang hoặt động'),
  ]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: lstService.length,
        itemBuilder: (BuildContext buildContext, int index) {
          ServiceItem service = lstService[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProviderDetailScreen(),
              ));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(service.image),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                service.salonOwner,
                                style: TextStyle(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500,
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
                                  Text('${service.rate}')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          service.titleService,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal,
                              fontSize: 13,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Text(
                              service.range,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey),
                            ),
                            Text(
                              ' | ${service.area}',
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
                              service.status,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Color(0xff28BEBA)),
                            ),
                            Text(
                              ' - ${service.timeLine}',
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
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecomendServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget myDetailsContainer1() {
      Size size = MediaQuery.of(context).size;
      return Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.2,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('public/img/beautician1.PNG'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 13),
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
        ),
      );
    }

    Widget myDetailsContainer2() {
      Size size = MediaQuery.of(context).size;
      return Card(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.2,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('public/img/beautician2.PNG'),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 13),
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
      ));
    }

    Widget myDetailsContainer3() {
      Size size = MediaQuery.of(context).size;
      return Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.2,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('public/img/beautician3.PNG'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 13),
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
        ),
      );
    }

    Widget myDetailsContainer4() {
      Size size = MediaQuery.of(context).size;
      return Card(
          child: Row(
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
            margin: const EdgeInsets.only(left: 10, top: 13),
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
      ));
    }

    return Column(
      children: [
        myDetailsContainer1(),
        myDetailsContainer2(),
        myDetailsContainer3(),
        myDetailsContainer4(),
        myDetailsContainer1(),
        myDetailsContainer2(),
        myDetailsContainer3(),
        myDetailsContainer4(),
      ],
    );
  }
}
