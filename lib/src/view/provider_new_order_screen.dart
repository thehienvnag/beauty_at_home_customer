import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/provider_confirm_screen.dart';
import 'package:flutter_app/src/widgets/google_map_service/google_service.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ProviderNewOderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}
final List<ServiceCusDetail> listDetail = List.from(<ServiceCusDetail>[
  ServiceCusDetail(
    cusID: 'GF -267',
    cusName: 'Hữu Long',
    address: 'võ văn hát , quận 9 , Tp Hồ Chí Minh',
    status: 'ON THE WAY',
    note: 'Làm sao để có một bản ghi chú hiệu quả mà không mất quá nhiều thời gian',
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
  ServiceCusDetail(
    cusID: 'GF -280',
    cusName: 'Thế Hiển',
    address: '5/3 đường số 9 , phước bình , quận 9 , Tp Hồ Chí Minh',
    status: 'ON THE WAY',
    note: 'Làm sao để có một bản ghi chú hiệu quả mà không mất quá nhiều thời gian',
    time: '7:37 PM',
    timeMove: '20 mins - 5km',
    payment: 'MOMO',
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

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final CountdownController controller = CountdownController();
  double minute = 20;
  String currentAddress = "";
  @override
  void initState(){
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
    final coordinates = new Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      currentAddress = first.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: Text('2 New Oders',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProviderScreen(),
            ));
          },
            child: Container(margin: EdgeInsets.only(right: 10),child: Icon(Icons.cancel ,color: Colors.black.withOpacity(0.5),)))]
      ),
      body:
      Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: listDetail.length,
                    itemBuilder: (BuildContext buildContext, int index) {
                      ServiceCusDetail service = listDetail[index];
                      return OutlinedCard(
                        margin: EdgeInsets.only(top: 4),
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
                                          style: TextStyle(fontWeight: FontWeight
                                              .bold),
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
                                    onTap: (){
                                      MapUtils4.openMap(currentAddress ,service.address);
                                     //MapUtils2.openMap(service.address);
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
                                Container(
                                    alignment:  Alignment.topLeft,
                                    child: Text('Đặt thời gian chuẩn bị')),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 315,
                                  height: 31,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color(0x42000000), width: 1, ),
                                  ),
                                  padding: const EdgeInsets.only(left: 22, top: 5, ),
                                  child: Row(
                                    children:[
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              minute  = minute - 10;
                                            });
                                          },
                                          child: Container(
                                              alignment: Alignment.center,margin: EdgeInsets.only(top: 8),width: 90,
                                              child: Icon(Icons.maximize_sharp))
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 105,
                                        height: 17,
                                        child: Text(
                                          "${this.minute} mins",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              minute  = minute + 10;
                                            });
                                          },
                                          child: Container(alignment: Alignment.center,width: 90,child: Icon(Icons.add))),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  width: 316,
                                  height: 30,
                                  child: Row(
                                    children:[
                                      GestureDetector(
                                        child: Container(
                                          width: 95,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(
                                              color: Color(0xffcf8b93), width: 1.50, ),
                                          ),
                                          padding: const EdgeInsets.only(left: 17, right: 18, top: 5),
                                          child: Text(
                                            "TỪ CHỐI",
                                            style: TextStyle(
                                              color: Color(0xffcf8b93),
                                              fontSize: 13,
                                              fontFamily: "Roboto",
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 19),
                                      GestureDetector(
                                        child: SizedBox(
                                          width: 200,
                                          height: 30,
                                          child: Material(
                                            color: Color(0xff50B644),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 1,
                                                color: Color(0x23000000), ),
                                              borderRadius: BorderRadius.circular(6),
                                            ),
                                            clipBehavior: Clip.antiAlias,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10, top: 8, bottom: 7, ),
                                              child: Center(
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(width: 20,),
                                                      Text(
                                                        "CHẤP NHẬN  ",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                          fontFamily: "Roboto",
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                      Countdown(
                                                        controller: controller.restart(),
                                                        seconds: 40,
                                                        build: (_, double time) => Text(' (${time.toString()}) ',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        interval: Duration(milliseconds: 100),
                                                        onFinished: () {
                                                          //

                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ]),
        bottomNavigationBar: WidgetUtils.appBottomNavigationBar(3),
    );
  }

}
class loadAllBooking extends StatelessWidget{
  final CountdownController controller = CountdownController();
  double minute = 20;
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
                                  style: TextStyle(fontWeight: FontWeight
                                      .bold),
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
                          Row(
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
                        Container(
                           alignment:  Alignment.topLeft,
                            child: Text('Set booking preparation time')),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 315,
                          height: 31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color(0x42000000), width: 1, ),
                          ),
                          padding: const EdgeInsets.only(left: 22, top: 5, ),
                          child: Row(
                            children:[
                              GestureDetector(
                                onTap: (){
                                  this.minute  = minute - 10;
                                },
                                  child: Container(
                                      alignment: Alignment.center,margin: EdgeInsets.only(top: 8),width: 90,
                                      child: Icon(Icons.maximize_sharp))
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 105,
                                height: 17,
                                child: Text(
                                  "${this.minute} mins",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(alignment: Alignment.center,width: 90,child: Icon(Icons.add)),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: (){
                            this.minute  = minute + 10;
                          },
                          child: Container(
                            width: 316,
                            height: 30,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Color(0xffcf8b93), width: 1.50, ),
                                  ),
                                  padding: const EdgeInsets.only(left: 17, right: 18, top: 5),
                                  child: Text(
                                    "TỪ CHỐI",
                                    style: TextStyle(
                                      color: Color(0xffcf8b93),
                                      fontSize: 13,
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 19),
                                SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: Material(
                                    color: Color(0xff50B644),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1,
                                        color: Color(0x23000000), ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 8, bottom: 7, ),
                                      child: Center(
                                        child: Container(
                                          child: Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              Text(
                                                "CHẤP NHẬN  ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: "Roboto",
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Countdown(
                                                controller: controller.restart(),
                                                seconds: 30,
                                                build: (_, double time) => Text(' (${time.toString()}) ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                                interval: Duration(milliseconds: 100),
                                                onFinished: () {
                                                  //

                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
        ),
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
