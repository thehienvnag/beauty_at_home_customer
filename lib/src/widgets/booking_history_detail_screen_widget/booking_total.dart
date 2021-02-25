import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';

final dynamic paymentMethodContents = {
  'momo': Row(
    children: [
      Image.asset(
        'public/img/momo_icon.png',
        width: 17,
      ),
      Text(' Momo'),
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
                    Text('Subtotal'),
                    Text(this.totalPriceBefore),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Applicable fees'),
                    Text(this.applicableFee),
                  ],
                ),
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
                      'Total',
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
                    Text('Payment method'),
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
