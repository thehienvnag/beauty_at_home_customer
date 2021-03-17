import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/view/provider_new_order_screen.dart';
import 'package:flutter_app/src/widgets/google_map_service/google_service.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class ProviderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

String currentAddress = "";

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

final List<ServiceCusDetail> listDetail = List.from(<ServiceCusDetail>[
  ServiceCusDetail(
    cusID: 'GF -267',
    cusName: 'Hữu Long',
    address: 'Jackson Park, California, Hoa Kỳ',
    status: 'ON THE WAY',
    note:
        'Làm sao để có một bản ghi chú hiệu quả mà không mất quá nhiều thời gian',
    time: '7:37 PM',
    timeMove: '20 mins - 5km',
    payment: 'CASH',
    totalBill: '740.000',
    listItem: List.from(
      <CartItem>[
        CartItem(
          content: 'Trang điểm dự tiệc',
          quantity: 1,
          price: '470.000',
        ),
        CartItem(
          content: 'Cắt móng uốn cong',
          quantity: 1,
          price: '270.000',
        ),
      ],
    ),
  ),
]);

class _DemoAppState extends State<DemoApp> {
  bool isSwiched = false;

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  getUserLocation() async {
    LocationData myLocation;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      myLocation = null;
    }
    final coordinates =
        new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      currentAddress = first.addressLine;
    });
  }

  Widget title(BuildContext context) {
    if (isSwiched == true)
      return (Row(
        children: [
          Card(
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.8),
                  width: 0.2,
                )),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.done_outlined,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
          Text(
            ' Hiện bạn có thể nhận đơn!',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black),
          ),
        ],
      ));
    else
      return (Row(
        children: [
          Card(
            color: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.8),
                  width: 0.2,
                )),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                FontAwesomeIcons.exclamation,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
          Text(
            'Hiện bạn không thể nhận đơn!',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black),
          ),
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: title(context),
        actions: [
          Switch(
            activeColor: Color(0xff256FEF),
            inactiveThumbColor: Color(0xff979797),
            activeTrackColor: Color(0xff256FEF),
            inactiveTrackColor: Color(0xff979797),
            value: isSwiched,
            onChanged: (value) {
              setState(() {
                isSwiched = value;
              });
            },
          ),
        ],
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(' Đơn đã chấp nhận',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SizedBox(
                        width: 63,
                        height: 24,
                        child: Material(
                          color: Color(0x2d27beba),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xff28beba),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 6,
                              top: 6,
                              bottom: 5,
                            ),
                            child: Text(
                              "Tất cả (${listDetail.length})",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff0db5b4),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      child: SizedBox(
                        width: 93,
                        height: 24,
                        child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0x60000000),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 16,
                              top: 6,
                              bottom: 5,
                            ),
                            child: Text(
                              "Chuẩn bị (1)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x7f000000),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      child: SizedBox(
                        width: 84,
                        height: 24,
                        child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0x60000000),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 5,
                              top: 6,
                              bottom: 4,
                            ),
                            child: Text(
                              "Đang làm (1)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x7f000000),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      child: SizedBox(
                        width: 92,
                        height: 24,
                        child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xff9e9d9d),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 7,
                              right: 8,
                              top: 6,
                              bottom: 4,
                            ),
                            child: Text(
                              "Hoàn thành (3)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0x7f000000),
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              loadAllBooking(),
            ],
          ),
        ),
      ]),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1.0),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProviderNewOderScreen(),
            ));
          },
          backgroundColor: Color(0xffe9b501),
          label: Row(
            children: <Widget>[
              SizedBox(
                width: 15,
              ),
              Text(
                '2 New Orders',
                style: TextStyle(color: Colors.white, letterSpacing: 4),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class loadAllBooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: listDetail.length,
          itemBuilder: (BuildContext buildContext, int index) {
            ServiceCusDetail service = listDetail[index];
            return OutlinedCard(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 4, right: 4),
              width: 360,
              sections: [
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 270,
                            child: Row(
                              children: [
                                Text(service.cusID),
                                Card(
                                  color: Color(0xff707DB9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      service.status,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              width: 60,
                              child: Text(
                                service.time,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Row(
                              children: [
                                Icon(Icons.face),
                                Text(
                                  ' Khách đặt: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                Text('${service.cusName}  '),
                                Text('(${service.timeMove})'),
                              ],
                            ),
                          ),
                          Container(
                            width: 30,
                            child: Icon(
                              Icons.keyboard_arrow_up,
                              size: 35,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        Row(children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, right: 5),
                              child: Icon(Icons.local_library_rounded)),
                          Container(
                            width: 270,
                            child: Text(
                              service.address,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ]),
                        GestureDetector(
                          onTap: () {
                            MapUtils4.openMap(currentAddress, service.address);
                            //MapUtils3.openMap(double.parse(latitudeData),double.parse(longitudeData),service.address);
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                width: 44,
                              ),
                              Text(
                                'Xem bản đồ',
                                style: TextStyle(
                                    color: Color(0xff0DB5B4), fontSize: 11),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Color(0xff0DB5B4),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, right: 5),
                            child: Icon(Icons.description_outlined)),
                        Container(
                            width: 270,
                            child: Text(
                              'Ghi chú: ${service.note}',
                              style: TextStyle(fontSize: 13),
                            ))
                      ],
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: service.listItem.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 6,
                    ),
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${service.listItem[index].quantity}  x',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                service.listItem[index].content,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(service.listItem[index].price)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            child: Row(
                              children: [
                                Text('Total bill: '),
                                Text(
                                  service.totalBill,
                                ),
                                Card(
                                  color: Color(0xffC4C4C4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      service.payment,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 30,
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 35,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 336,
                        height: 30,
                        child: Material(
                          color: Color(0xff7899D4),
                          borderRadius: BorderRadius.circular(5),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 87,
                              right: 88,
                              top: 8,
                              bottom: 9,
                            ),
                            child: Text(
                              "Bắt đầu làm việc ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class ServiceCusDetail {
  String cusName; // hưu long
  String cusID; // GF-267
  String address; // 5/3 đường số 9 , phước bình , quận 9 . tp hcm
  String status; // on the way
  String note; // LÀM Sao để có 1 bản ghi chú hiệu quả
  String time; // 7.37 PM
  String timeMove; // 20 mins - 5km
  String totalBill;
  String payment;
  List<CartItem> listItem; // trang điểm dự tiệc

  ServiceCusDetail({
    this.cusName,
    this.cusID,
    this.address,
    this.status,
    this.note,
    this.time,
    this.timeMove,
    this.totalBill,
    this.payment,
    this.listItem,
  });
}
