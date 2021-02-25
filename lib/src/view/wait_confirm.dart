import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/presenter/booking_summary_presenter.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/booking_summary.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';

List<CartItem> listItem = List.from(
  <CartItem>[
    CartItem(
      content: '90 phút massage body toàn thân',
      quantity: 2,
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
    ),
    CartItem(
      content: 'Sơn móng Hoa Hướng Dương',
      quantity: 1,
    ),
  ],
);

class WaitConfirmScreen extends StatefulWidget {
  @override
  _WaitConfirmScreenState createState() => _WaitConfirmScreenState();
}

class _WaitConfirmScreenState extends State<WaitConfirmScreen> {
  @override
  void initState() {
    super.initState();

    Future(() {
      Future.delayed(Duration(seconds: 5));
    }).then(
      (value) => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BookingSummary(
          presenter: BookingSummaryPresenter(),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: screenSize.width * 0.9,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: CoverImage(
                  path: 'public/img/cus_wait_confirm.png',
                ),
              ),
              OutlinedCard(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: 360,
                sections: [
                  ProcessingRow(),
                ],
              ),
              OutlinedCard(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 12, right: 12, top: 10),
                width: 360,
                sections: [
                  OrderSummary(
                    title: 'Makeup Hoàng Gia',
                    priceAfter: '458.000đ',
                    priceBefore: '650.000đ',
                  ),
                  ItemsList(itemList: listItem),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
