import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';

final dynamic paymentMethodContents = {
  'momo': Row(
    children: [
      Image.asset(
        'public/img/iconcash.PNG',
        width: 17,
      ),
      Text(' Tiền mặt'),
    ],
  ),
};

class BookingTotal extends StatelessWidget {
  final String totalPriceBefore, totalPriceAfter, applicableFee, paymentMethod;
  const BookingTotal({
    Key key,
    this.totalPriceBefore,
    this.totalPriceAfter,
    this.applicableFee,
    this.paymentMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: FullWidthCard(
        padding: EdgeInsets.symmetric(horizontal: 20),
        sections: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng đơn'),
                    Text(this.totalPriceBefore),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Phí áp dụng'),
                //     Text(this.applicableFee),
                //   ],
                // ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thành tiền',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      this.totalPriceAfter,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Thanh toán qua'),
                    paymentMethodContents[this.paymentMethod],
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
