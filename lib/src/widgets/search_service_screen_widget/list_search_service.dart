import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/provider_detail_model/provider_model.dart';
import 'package:flutter_app/src/view/provider_detail_screen.dart';
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
      child: ListView.builder(
        itemCount: lstService.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext buildContext, int index) {
          Staff staff = lstStaffService[index];
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.7),
                  width: 0.2,
                )),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProviderDetailScreen(),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 230,
                        margin: const EdgeInsets.only(left: 15, top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  staff.salonOwner,
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffFFCC00),
                                    ),
                                    Text(' ${staff.rate}')
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              staff.titleService,
                              style: TextStyle(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  staff.range,
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.grey),
                                ),
                                Text(
                                  ' | ${staff.area}',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Colors.grey),
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
                  ),
                ),
                Container(
                    width: size.width * 0.9,
                    height: 1,
                    color: Colors.black.withOpacity(0.2)),
                ItemsList(itemList: staff.listService)
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemsList extends StatelessWidget {
  final List<ServiceItem> itemList;

  const ItemsList({
    Key key,
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (context, index) => Column(
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
                                  itemList[index].titleService,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    width: 28,
                                    height: 22,
                                    child: Icon(
                                      Icons.attach_money_sharp,
                                      color: Colors.black,
                                      size: 20,
                                    )),
                                Text(
                                  ' ${itemList[index].price}',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
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
                            itemList[index].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      width: size.width * 0.9,
                      height: 1,
                      color: Colors.black.withOpacity(0.2)),
                ],
              ),
              if (index + 1 < itemList.length)
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
