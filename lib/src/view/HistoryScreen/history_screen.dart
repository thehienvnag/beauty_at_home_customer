import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:flutter_app/src/models-new/booking_model.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/BookingHistoryDetail/booking_history_detail.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          title: Column(
            children: [
              Text(
                'Hoạt động của bạn',
                style: CustomTextStyle.headerText(Colors.black87),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Đơn hiện tại',
                      style: CustomTextStyle.titleText(Colors.black87),
                    )),
              ),
              Tab(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Lịch sử hoạt động',
                      style: CustomTextStyle.titleText(Colors.black87),
                    )),
              ),
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: [
              _noActive(context),
              LoadHistory(),
            ],
          ),
        ),
        bottomNavigationBar: WidgetUtils.appBottomNavigationBar(1),
      ),
    );
  }
}

Widget _noActive(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    child: Column(
      children: <Widget>[
        Card(
          child: Container(
            alignment: Alignment.topLeft,
            color: Colors.grey.withOpacity(0.1),
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      'Hiện vẫn chưa có đơn nào',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )),
                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.only(top: 5, left: 15),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    'Đơn sẽ xuất hiện khi bạn sử dụng các dịch vụ của chúng tôi.',
                    style: CustomTextStyle.subtitleText(Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class History {
  final String saloner, imgUrl;
  final int numService;
  final String date;
  final Function press;

  History({
    this.saloner,
    this.imgUrl,
    this.numService,
    this.date,
    this.press,
  });
}

class LoadHistory extends StatefulWidget {
  @override
  _LoadHistoryState createState() => _LoadHistoryState();
}

class _LoadHistoryState extends State<LoadHistory> {
  @override
  void initState() {
    super.initState();
    var accountId = context.read<AccountProvider>().accountSignedIn.uid;
    log(accountId.toString());
    context
        .read<BookingProvider>()
        .initBookingListByCustomerId(accountId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, value, child) {
        if (value.listBooking == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: value.listBooking.length,
            itemBuilder: (BuildContext buildContext, int index) {
              BookingModel bookingModel = value.listBooking[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BookingHistoryDetailScreen(
                      id: bookingModel.id.toString(),
                    ),
                  ));
                },
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 2),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    margin:
                                        EdgeInsets.only(left: 10, right: 13),
                                    child: Image.network(
                                      bookingModel?.beautyArtistAccount.gallery
                                          .images.first.imageUrl,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    height: 50,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: bookingModel
                                                ?.beautyArtistAccount
                                                ?.displayName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black
                                                    .withOpacity(0.7)),
                                          ),
                                          TextSpan(
                                            text:
                                                "\n${bookingModel.bookingDetails.length} dịch vụ",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    bookingModel.status,
                                    style: CustomTextStyle.subtitleText(
                                        Colors.blueAccent),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    Utils.formatDate(bookingModel.createDate),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 380,
                          height: 0.5,
                          color: Colors.black.withOpacity(0.5)),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

class Active {
  String saloners, imgUrls, status;
  int numServices;
  Function pres;

  Active({
    this.saloners,
    this.imgUrls,
    this.numServices,
    this.status,
    this.pres,
  });
}

class LoadActive extends StatelessWidget {
  List<Active> lstActive = List.from([]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<BookingProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: value.listBooking.length,
              itemBuilder: (BuildContext buildContext, int index) {
                BookingModel bookingModel = value.listBooking[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => BookingHistoryDetailScreen(
                        id: bookingModel.id.toString(),
                      ),
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Text("Ảnh thợ thiếu"),
                                ),
                                // Container(
                                //     width: 50,
                                //     margin: EdgeInsets.only(right: 13),
                                //     child: Image.network(
                                //       bookingModel?.beautyArtistAccount.gallery
                                //           .images.first.imageUrl,
                                //       width: 50,
                                //       height: 50,
                                //     )),
                                Container(
                                  width: 160,
                                  margin: EdgeInsets.only(top: 5),
                                  height: 50,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: bookingModel
                                              ?.beautyArtistAccount
                                              ?.displayName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.black
                                                  .withOpacity(0.7)),
                                        ),
                                        TextSpan(
                                          text:
                                              "\n${bookingModel.bookingDetails.length} dịch vụ",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 100,
                                    child: Text(
                                      bookingModel?.beautyArtistAccount?.status,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(0.4),
                                      ),
                                      textAlign: TextAlign.left,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Container(color: Colors.white),
                        ),
                        Container(
                            width: 400,
                            height: 0.5,
                            color: Colors.black.withOpacity(0.5)),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
