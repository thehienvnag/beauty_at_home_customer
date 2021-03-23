import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CheckoutAppBarTitle extends StatelessWidget {
  const CheckoutAppBarTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(21),
        child: Divider(
          height: 20,
          thickness: 0.5,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Column(
        children: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              String providerName = value.cart?.providerName;
              return Text(
                providerName,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black),
              );
            },
          ),
          // Text(
          //   'Khoảng cách tới chỗ bạn: 4,9 km',
          //   style: TextStyle(
          //       fontWeight: FontWeight.normal,
          //       fontSize: 15,
          //       color: Colors.black),
          // ),
        ],
      ),
      actions: [
        Consumer<CartProvider>(
          builder: (context, value, child) {
            String providerImage = value.cart.providerImage;
            return CircleAvatar(
              backgroundImage: NetworkImage(providerImage),
              radius: 20,
            );
          },
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
        )
      ],
    );
  }
}
