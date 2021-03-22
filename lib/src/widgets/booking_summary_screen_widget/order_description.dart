import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/booking_detail_model.dart';

import 'package:flutter_app/src/models/cart_item.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';

class OrderDescription extends StatelessWidget {
  final List<BookingDetailModel> listItem;
  final String title, priceAfter, priceBefore;
  const OrderDescription({
    Key key,
    this.listItem,
    this.priceBefore,
    this.title,
    this.priceAfter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return OutlinedCard(
      padding: EdgeInsets.only(left: 12, right: 12, top: 10),
      width: screenSize.width * 0.95,
      sections: [
        OrderSummary(
          title: this.title,
          //priceAfter: this.priceAfter,
          priceBefore: this.priceBefore,
        ),
        ItemsList(itemList: listItem),
      ],
    );
  }
}
