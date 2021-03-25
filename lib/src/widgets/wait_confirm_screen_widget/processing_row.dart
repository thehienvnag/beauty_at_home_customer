import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/booking_detail_model.dart';
import 'package:flutter_app/src/models-new/booking_model.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/booking_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/BookingSummary/booking_summary.dart';
import 'package:provider/provider.dart';

class ProcessingRow extends StatefulWidget {
  @override
  _ProcessingRowState createState() => _ProcessingRowState();
}

class _ProcessingRowState extends State<ProcessingRow>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    var bookingProvider = context.read<BookingProvider>();
    Utils.sleep(8, () async {
      var cartProvider = context.read<CartProvider>();
      var accountProvider = context.read<AccountProvider>();
      List<Map<String, dynamic>> bookingDetails = [];
      cartProvider.cart.services.forEach((key, value) {
        bookingDetails.add(
          BookingDetailModel(
            serviceId: key.id,
            serviceName: key.serviceName,
            servicePrice: key.price,
            quantity: value,
          ).toJson(),
        );
      });

      Map<String, dynamic> _model = {
        "bookingDetails": bookingDetails,
        "note": "Làm sao để có một ghi chú ngắn gọn",
        "customerAccountId": int.parse(cartProvider.cart.customerAccountId),
        "beautyArtistAccountId":
            int.parse(cartProvider.cart.beautyArtistAccountId),
        "endAddress": accountProvider.currentAddress,
        "totalFee":
            double.parse(Utils.calculatePrice(cartProvider.cart.services)),
      };
      int id = await bookingProvider.createBooking(_model);

      if (id != null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BookingSummary(
            id: id.toString(),
          ),
        ));
      }
    });
  }

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
                child: Text('Đang xử lý...'),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Hủy đơn',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
