import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/wait_confirm_model.dart';

class WaitConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                HorizontalCenterBgImage(
                  path: 'public/img/cus_wait_confirm.png',
                ),
                OutlinedCard(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  width: 360,
                  sections: [
                    ProcessingRow(),
                  ],
                ),
                OutlinedCard(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  width: 360,
                  sections: [
                    OrderSummary(
                      title: 'Makeup Hoàng Gia',
                      priceAfter: '458.000đ',
                      priceBefore: '650.000đ',
                    ),
                    ItemsList(itemList: listItem)
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class HorizontalCenterBgImage extends StatelessWidget {
  final String path;
  const HorizontalCenterBgImage({
    Key key,
    this.path,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            this.path,
            width: 280,
          ),
        ),
      ],
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
  ],
);

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
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (context, index) => Column(
            children: [
              ItemDescriptionRow(
                quantity: itemList[index].quantity,
                text: itemList[index].content,
              ),
              if (index + 1 < itemList.length)
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => {},
              child: Text(
                '${itemList.length - 1} more...',
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

class OrderSummary extends StatelessWidget {
  final String title, priceAfter, priceBefore;

  const OrderSummary({Key key, this.title, this.priceAfter, this.priceBefore})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              Text('Total'),
              Text(
                this.priceAfter,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              this.priceBefore,
              style: TextStyle(
                fontSize: 13,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProcessingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Row(
            children: [
              Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text('Processing...'),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            'Cancel',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
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
            '${this.text}',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class OutlinedCard extends StatelessWidget {
  final double width;
  final EdgeInsets margin, padding;
  final List<Widget> sections;
  const OutlinedCard({
    Key key,
    this.width,
    this.margin,
    this.padding,
    this.sections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 0.5,
          ),
        ),
        margin: this.margin,
        child: Container(
          padding: this.padding,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: sections.length,
            itemBuilder: (context, index) => Column(
              children: [
                sections[index],
                if (index + 1 < sections.length)
                  Divider(
                    height: 35,
                    thickness: 0.7,
                    indent: 3,
                    endIndent: 3,
                    color: Colors.grey,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
