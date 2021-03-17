import 'package:flutter/material.dart';

import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';

class BookingDescription extends StatelessWidget {
  final List<CartItem> itemList;
  const BookingDescription({
    Key key,
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullWidthCard(
      marginTop: 10,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      sections: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tóm tắt đơn',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              TextButton(
                child: Text(
                  'Đặt lại',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.symmetric(horizontal: 7),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: itemList.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 6,
            ),
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${itemList[index].quantity}x',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(itemList[index].content),
                    ),
                  ],
                ),
                Text(itemList[index].price)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
