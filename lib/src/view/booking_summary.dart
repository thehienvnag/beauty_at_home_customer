import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/widgets/booking_summary_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';

final List<Widget> dynamicContents = [
  CoverImage(
    path: 'public/img/cus_wait_confirm.png',
  ),
  CoverImage(
    path: 'public/img/cus_under_working.png',
  ),
];

class BookingSummary extends StatefulWidget {
  const BookingSummary({
    Key key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BookingSummaryState();
}

class _BookingSummaryState extends State<BookingSummary> {
  int currentStep = 0;
  @override
  void initState() {
    super.initState();

    Utils.redoTaskPerDuration(
        () {
          setState(() {
            currentStep++;
          });
        },
        10000,
        1,
        () {
          Navigator.of(context).pushReplacementNamed(Routes.bookingHistory);
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: DetailScreenAppBar(
          disabledBack: true,
          title: Text(
            'Booking Summary',
            style: TextStyle(color: Color(0xff636363), fontSize: 18),
          ),
        ),
      ),
      body: SlidingUpView(
        minHeight: screenSize.height * 0.4,
        maxHeight: screenSize.height * 0.6,
        body: dynamicContents[currentStep],
        panelContents: [
          BookingProgress(
            currentStepIndex: 1,
          ),
          BeauticianDescription(
            image: 'public/img/beautician_test.png',
            beauticianName: 'Marry Trần',
            mainService: 'Trang điểm - Làm tóc',
            phone: '0918076861',
          ),
          OutlinedCard(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            width: screenSize.width * 0.95,
            sections: [
              LocationSummary(
                address: '5/3 đường số 9',
              ),
            ],
          ),
          OrderDescription(
            title: 'Makeup Hoàng Gia',
            priceAfter: '458.000đ',
            priceBefore: '650.000đ',
            listItem: listItem,
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("HỦY ĐƠN"),
          )
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
