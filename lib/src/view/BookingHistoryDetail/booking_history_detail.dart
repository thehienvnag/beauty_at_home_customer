import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/view/HomeScreen/home_screen.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/beautician_history_description.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/booking_description.dart';
import 'package:flutter_app/src/widgets/booking_history_detail_screen_widget/booking_total.dart';
import 'package:flutter_app/src/widgets/booking_summary_screen_widget/location_summary.dart';
import 'package:flutter_app/src/widgets/shared_widget/detail_screen_appbar.dart';
import 'package:flutter_app/src/widgets/shared_widget/fullwidth_card.dart';

class BookingHistoryDetailScreen extends StatefulWidget {
  @override
  _BookingHistoryDetailScreenState createState() =>
      _BookingHistoryDetailScreenState();
}

class _BookingHistoryDetailScreenState
    extends State<BookingHistoryDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() async {
      await Future.delayed(Duration(seconds: 15));
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    }).then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DetailScreenAppBar(
          disabledBack: true,
          title: Text(
            'JAN 31, 2021 8:27 AM',
            style: TextStyle(color: Color(0xff636363), fontSize: 16),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          BeauticianHistoryDescription(),
          FullWidthCard(
            marginTop: 10,
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            sections: [
              LocationSummary(
                address: '5/12 đường số 9',
              ),
            ],
          ),
          BookingDescription(
            itemList: listItem,
          ),
          BookingTotal(
            totalPriceBefore: '720.000',
            totalPriceAfter: '737.000',
            applicableFee: '17.000',
            paymentMethod: 'momo',
          ),
        ],
      ),
    );
  }
}

List<CartItem> listItem = List.from(
  <CartItem>[
    CartItem(
      content: '90 phút massage body toàn thân',
      quantity: 2,
      price: '400.000',
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
      price: '400.000',
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
      price: '400.000',
    ),
  ],
);
