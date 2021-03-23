import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/booking_detail_model.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/widgets/shared_widget.dart';
import 'package:flutter_app/src/widgets/wait_confirm_screen_widget.dart';
import 'package:provider/provider.dart';

class WaitConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: screenSize.width * 0.9,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: CoverImage(
                  path: 'public/img/cus_wait_confirm.png',
                ),
              ),
              OutlinedCard(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: 360,
                sections: [
                  ProcessingRow(),
                ],
              ),
              OutlinedCard(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 12, right: 12, top: 10),
                width: 360,
                sections: [
                  Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return OrderSummary(
                        title: value.cart.providerName,
                        priceBefore: Utils.formatPrice(
                          Utils.calculatePrice(value.cart.services),
                        ),
                      );
                    },
                  ),
                  Consumer<CartProvider>(
                    builder: (context, value, child) {
                      List<BookingDetailModel> bookingDetails = [];
                      value.cart.services.forEach(
                        (key, value) => bookingDetails.add(
                          BookingDetailModel(
                            serviceName: key.serviceName,
                            quantity: value,
                            servicePrice: key.price,
                          ),
                        ),
                      );
                      return ItemsList(itemList: bookingDetails);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
