import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_model.dart';
import 'package:flutter_app/src/view/provider_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/fullwidth_card.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import '../search_screen_widget.dart';

class Staff {
  final String image;
  final String salonOwner;
  final String titleService;
  final List<ServiceItem> listService;
  final double rate;
  final String area;
  String range;
  String status;

  Staff(
      {this.image,
      this.listService,
      this.salonOwner,
      this.titleService,
      this.rate,
      this.area,
      this.range});
}

List<ServiceItem> lstService = List.from([
  ServiceItem(
      titleService: '90 phút massage body toàn thân',
      price: '200.000',
      image: 'public/img/beautician1.png'),
  ServiceItem(
      titleService: '60 phút massage body toàn thân',
      price: '150.000',
      image: 'public/img/beautician2.png'),
  ServiceItem(
      titleService: '30 phút massage body toàn thân',
      price: '100.000',
      image: 'public/img/beautician3.png'),
  ServiceItem(
    titleService: '10 phút massage body toàn thân',
    price: '80.000',
    image: 'public/img/beautician3.png',
  ),
]);
List<Staff> lstStaffService = List.from([
  Staff(
    image: 'public/img/beautician2.png',
    salonOwner: 'Đức Trần',
    titleService: 'Massage chân tay, giác hơi',
    rate: 5,
    area: 'Quận 3, TP.Hồ Chí Minh',
    range: '4 Km',
    listService: lstService,
  ),
  Staff(
    image: 'public/img/beautician1.png',
    salonOwner: 'Hani Nguyễn',
    titleService: 'Massage - Bấm huyệt',
    rate: 5,
    area: 'Quận 2, TP.Hồ Chí Minh',
    range: '6 Km',
    listService: lstService,
  ),
  Staff(
    image: 'public/img/beautician2.png',
    salonOwner: 'Tony Đặng',
    titleService: 'Massage - Giác hơi',
    rate: 5,
    area: 'Quận 9, TP.Hồ Chí Minh',
    range: '4 Km',
    listService: lstService,
  ),
  Staff(
    image: 'public/img/beautician3.png',
    salonOwner: 'Merry Trần',
    titleService: 'Massage',
    rate: 4.8,
    area: 'Quận 9, TP.Hồ Chí Minh',
    range: '3.5 Km',
    listService: lstService,
  ),
  Staff(
    image: 'public/img/beautician2.png',
    salonOwner: 'Lyly Phạm',
    titleService: 'Massage chân tay, giác hơi',
    rate: 5,
    area: 'Quận 3, TP.Hồ Chí Minh',
    range: '4 Km',
    listService: lstService,
  ),
]);

class ListSearchServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          color: Colors.grey.withOpacity(0.25),
          height: 8,
        ),
        itemCount: lstStaffService.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Staff staff = lstStaffService[index];
          return FullWidthCard(
            hasDivider: false,
            hasBorder: false,
            sections: [
              _buildStaff(staff),
              ..._buildServices(staff.listService, size),
            ],
          );
        },
      ),
    );
  }

  Row _buildStaff(Staff staff) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 230,
          margin: const EdgeInsets.only(left: 15, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    staff.salonOwner,
                    style: CustomTextStyle.titleText(Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFCC00),
                        ),
                        Text(
                          ' ${staff.rate}',
                          style: CustomTextStyle.subtitleText(Colors.black87),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                staff.titleService,
                style: CustomTextStyle.subtitleText(Colors.black54),
              ),
              Row(
                children: [
                  Text(
                    staff.range,
                    style: CustomTextStyle.subtitleText(Colors.black87),
                  ),
                  Text(
                    ' | ${staff.area}',
                    style: CustomTextStyle.subtitleText(Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(staff.image),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildServices(List<ServiceItem> lstServices, Size size) {
    return lstServices
        .map<Widget>(
          (item) => Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35),
                      ),
                      Container(
                        width: 250,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.titleService,
                                  style: CustomTextStyle.subtitleText(
                                      Colors.black87),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black54,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    width: 18,
                                    height: 14,
                                    child: Icon(
                                      Icons.attach_money_sharp,
                                      color: Colors.black54,
                                      size: 12,
                                    ),
                                  ),
                                  Text(
                                    ' ${item.price}',
                                    style: CustomTextStyle.subtitleText(
                                        Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        width: 50,
                        height: 50,
                        child: Image(
                          image: AssetImage(
                            item.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        )
        .toList();
  }
}
