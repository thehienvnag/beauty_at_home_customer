import 'package:flutter/cupertino.dart';

class OrderSummary extends StatelessWidget {
  final String title, priceAfter, priceBefore;

  const OrderSummary({Key key, this.title, this.priceAfter, this.priceBefore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng đơn'),
              Text(
                this.priceBefore,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Text(
        //       this.priceBefore,
        //       style: TextStyle(
        //         fontSize: 13,
        //         decoration: TextDecoration.lineThrough,
        //       ),
        //     ),
        //   ],
        // ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Phương thức thanh toán'),
              Row(
                children: [
                  Image.asset(
                    'public/img/iconcash.PNG',
                    width: 20,
                  ),
                  Text(' Tiền mặt'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
