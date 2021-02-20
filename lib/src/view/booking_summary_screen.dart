import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/wait_confirm_model.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card_expandable.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';

class BookingSummaryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.5,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            color: Color(0xff636363),
            onPressed: () {},
            iconSize: 40,
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Booking Summary',
            style: TextStyle(color: Color(0xff636363), fontSize: 18),
          ),
        ),
      ),
      body: SlidingUpView(
        minHeight: 225,
        maxHeight: 450,
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.topCenter,
            child: CoverImage(
              path: 'public/img/cus_wait_confirm.png',
            ),
          ),
        ),
        panelContents: [
          OutlinedCardExpandable(),
          OutlinedCard(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            width: screenSize.width * 0.95,
            sections: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'public/img/beautician_test.png',
                        width: 45,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Marry Trần',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Trang điểm - Làm tóc',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          OutlinedCard(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            width: screenSize.width * 0.95,
            sections: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xff0A8988),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('5/3 đường số 9'),
                  )
                ],
              )
            ],
          ),
          OutlinedCard(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            width: screenSize.width * 0.95,
            sections: [
              OrderSummary(
                title: 'Makeup Hoàng Gia',
                priceAfter: '458.000đ',
                priceBefore: '650.000đ',
              ),
              ItemsList(itemList: listItem),
            ],
          ),
          OutlinedCard(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            width: screenSize.width * 0.95,
            sections: [
              OrderSummary(
                title: 'Makeup Hoàng Gia',
                priceAfter: '458.000đ',
                priceBefore: '650.000đ',
              ),
              ItemsList(itemList: listItem),
            ],
          ),
          OutlinedCard(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            width: screenSize.width * 0.95,
            sections: [
              OrderSummary(
                title: 'Makeup Hoàng Gia',
                priceAfter: '458.000đ',
                priceBefore: '650.000đ',
              ),
              ItemsList(itemList: listItem),
            ],
          ),
          OutlinedCard(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            width: screenSize.width * 0.95,
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
