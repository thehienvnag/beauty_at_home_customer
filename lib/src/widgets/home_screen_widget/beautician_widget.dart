import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/beautician_model.dart';

class BeauticianWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  fontSize: 18,
                  color: Colors.black),
            ),
          ],
        ),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 12,
            );
          },
          shrinkWrap: true,
          itemCount: listBeautician.length,
          itemBuilder: (context, index) {
            return Beautician(model: listBeautician[index]);
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class Beautician extends StatelessWidget {
  final BeauticianModel model;

  const Beautician({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Image(
                image: AssetImage(model.image),
                fit: BoxFit.cover,
                height: 70,
                width: 60,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: size.width * 0.72,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.beauticianName,
                          style: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFFCC00),
                              ),
                              Text('${model.rateScore}')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    model.nameService,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        model.distance,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.grey),
                      ),
                      Text(
                        ' | ' + model.location,
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
                        model.status,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: Colors.blue),
                      ),
                      Text(
                        model.openHours,
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
  }
}

List<BeauticianModel> listBeautician = List.from(<BeauticianModel>[
  BeauticianModel(
    'Marry Trần',
    'Trang điểm - Làm tóc',
    '5 km',
    4.8,
    'public/img/beautician1.PNG',
    'Quận 1, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    'Hani Nguyễn',
    'Trang điểm - Làm tóc',
    '5 km',
    4.8,
    'public/img/beautician2.PNG',
    'Quận 1, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    'Mai Hà Trần',
    'Trang điểm - Làm tóc',
    '5 km',
    4.8,
    'public/img/beautician3.PNG',
    'Quận 1, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    'Hani Nguyễn',
    'Trang điểm - Làm tóc',
    '5 km',
    4.8,
    'public/img/beautician2.PNG',
    'Quận 1, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
]);
