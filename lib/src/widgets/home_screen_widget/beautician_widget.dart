import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models/beautician_model.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/ProviderDetail/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

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
              'GỢI Ý THỢ TỐT CHO BẠN',
              style: CustomTextStyle.headline600Text(Colors.black),
            ),
          ),
        ),
        Consumer<ProviderDetailProvider>(
          builder: (context, value, child) {
            if (value.listProviderHome == null) {
              return Text("No data");
            }
            return ListView.separated(
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
              itemCount: value.listProviderHome.length,
              itemBuilder: (context, index) {
                return Beautician(model: value.listProviderHome[index]);
              },
            );
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
  final ProviderModel model;

  const Beautician({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String imageUrl = model.gallery?.images?.first?.imageUrl;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderDetailScreen(id: model.id.toString()),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: imageUrl == null
                  ? Align(
                      alignment: Alignment.center,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                      child: Image.network(
                        imageUrl,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
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
                          model.displayName,
                          style: CustomTextStyle.titleText(Colors.black),
                        ),
                        Container(
                          child: Row(
                            children: [
                              if (model.rateScore != null &&
                                  model.rateScore > 0)
                                Row(
                                  children: [
                                    Text(
                                      model.rateScore.toStringAsFixed(1),
                                      style: CustomTextStyle.subtitleText(
                                          Colors.black87),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                )
                              else
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: Text(
                                    "Thợ mới",
                                    style: CustomTextStyle.subtitleText(
                                      Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3)),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    model.description == null
                        ? "Trang điểm - makeup"
                        : model.description,
                    style: CustomTextStyle.subtitleText(Colors.black87),
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: size.width * 0.7,
                  //       child: RichText(
                  //         text: TextSpan(children: [
                  //           // TextSpan(
                  //           //   text: "5km",
                  //           //   style: CustomTextStyle.subtitleText(Colors.black),
                  //           // ),
                  //           TextSpan(
                  //             text: ' | ' +
                  //                 (model.addresses.isEmpty
                  //                     ? "Chưa xác định địa chỉ"
                  //                     : model.addresses.first.location),
                  //             style: CustomTextStyle.subtitleText(Colors.grey),
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Row(
                    children: [
                      // Text(
                      //   model.status,
                      //   style: CustomTextStyle.subtitleText(Color(0xff28BEBA)),
                      // ),
                      Utils.getStatus(model.status),
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
