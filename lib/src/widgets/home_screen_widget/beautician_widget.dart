import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/beautician_model.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class BeauticianWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.only(left: 10, bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'THỢ TỐT GẦN BẠN',
              style: CustomTextStyle.headline600Text(Colors.black),
            ),
          ),
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderDetailScreen(id: "3"),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Align(
                alignment: Alignment.bottomRight,
                heightFactor: 1,
                widthFactor: 1,
                child: Image.asset(model.image),
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
                          style: CustomTextStyle.titleText(Colors.black),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xffFFCC00),
                              ),
                              Text(
                                '${model.rateScore}',
                                style: CustomTextStyle.subtitleText(
                                    Colors.black87),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    model.nameService,
                    style: CustomTextStyle.subtitleText(Colors.black87),
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.7,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: model.distance,
                              style: CustomTextStyle.subtitleText(Colors.black),
                            ),
                            TextSpan(
                              text: ' | ' + model.location,
                              style: CustomTextStyle.subtitleText(Colors.grey),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        model.status,
                        style: CustomTextStyle.subtitleText(Color(0xff28BEBA)),
                      ),
                      Text(
                        model.openHours,
                        style: CustomTextStyle.subtitleText(Colors.grey),
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
    "3",
    'Marry Trần',
    'Trang điểm - Làm tóc',
    '2 km',
    4.8,
    'public/img/beautician1.PNG',
    '5/3 đường số 9, phường Long Thạnh Mỹ, quận 9, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    "4",
    'Hani Nguyễn',
    'Trang điểm - Làm tóc',
    '3 km',
    4.8,
    'public/img/beautician2.PNG',
    'Q.Thủ Đức, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    "5",
    'Mai Hà Trần',
    'Trang điểm - Làm tóc',
    '5 km',
    4.8,
    'public/img/beautician3.PNG',
    'Quận 2, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
  BeauticianModel(
    "12",
    'Hani Nguyễn',
    'Trang điểm - Làm tóc',
    '2 km',
    4.8,
    'public/img/beautician2.PNG',
    'Quận 9, TP. Hồ Chí Minh',
    'Đang hoạt động',
    ' - 9:00 AM - 8:30 PM',
  ),
]);
