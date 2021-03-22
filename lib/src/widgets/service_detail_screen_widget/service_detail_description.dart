import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';

class ServiceDetailDescription extends StatelessWidget {
  final String name;
  final String note;
  final String price;
  final bool isFromPromotion;

  const ServiceDetailDescription({
    Key key,
    this.name,
    this.note,
    this.price,
    this.isFromPromotion = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey[200], offset: Offset(0.0, 8.0))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.7,
                padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    if (isFromPromotion)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '145.000đ',
                            style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$priceđ',
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      )
                    else
                      Column(
                        children: [
                          Text(
                            '$price',
                            style: TextStyle(
                                fontSize: 19.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              note,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          if (isFromPromotion)
            Container(
              margin: EdgeInsets.only(left: 10, top: 5),
              width: 180,
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border(),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.local_activity,
                    color: Colors.amber[500],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Đã áp dụng voucher',
                      style: CustomTextStyle.subtitleText(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
