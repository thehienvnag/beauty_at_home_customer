import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/src/models/wait_confirm_model.dart';

class ItemsList extends StatelessWidget {
  final List<CartItem> itemList;
  const ItemsList({
    Key key,
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          itemBuilder: (context, index) => ItemDescriptionRow(
            quantity: itemList[index].quantity,
            text: itemList[index].content,
          ),
          separatorBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 10),
          ),
          itemCount: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '+ ${itemList.length - 1} more...',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ItemDescriptionRow extends StatelessWidget {
  final int quantity;
  final String text;
  const ItemDescriptionRow({
    Key key,
    this.quantity,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${this.quantity}x',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(left: 25),
        ),
        Flexible(
          child: Text(
            'Bạn đã đặt ${this.text}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}