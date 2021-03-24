import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:flutter_app/src/view/LocationChangeDescription/location_change_description_screen.dart';
import 'package:flutter_app/src/view/WaitConfirm/wait_confirm.dart';
import 'package:flutter_app/src/widgets/checkout_screen_widget.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

final currentPayment = List.from([
  "public/img/momo_icon.png",
  "public/img/iconcash.PNG",
]);

class _CheckoutScreenState extends State<CheckoutScreen> {
  int currentPaymentIndex;
  String note = null;

  @override
  void initState() {
    super.initState();
    currentPaymentIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    var cart = context.select<CartProvider, CartModel>((value) => value.cart);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: screenSize.width * 0.95,
        child: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          onPressed: () {
            var cartProvider = context.read<CartProvider>();
            cartProvider.setEnableProgressing();

            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => WaitConfirmScreen(),
            ));
          },
          backgroundColor: Color(0xff28BEBA),
          label: Text(
            'ĐẶT ĐƠN',
            style: TextStyle(color: Colors.white, letterSpacing: 4),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: CheckoutAppBarTitle(),
        ),
      ),
      body: Container(
        height: screenSize.height * 0.9,
        width: screenSize.width,
        margin: const EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text(
                  'Địa điểm tới',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: screenSize.width * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color(0xff0DB5B4),
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consumer<AccountProvider>(
                              builder: (context, value, child) {
                                String address = value.currentAddress == null
                                    ? "Chưa xác định địa chỉ"
                                    : value.currentAddress;
                                return Text(
                                  Utils.shortenString(address, 24),
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                );
                              },
                            ),
                            Consumer<AccountProvider>(
                                builder: (context, value, child) {
                              String address = value.currentAddress == null
                                  ? "Chưa xác định địa chỉ"
                                  : value.currentAddress;
                              return Text(
                                address,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width*0.8,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    maxLines: 2,
                    decoration: InputDecoration(
                      //contentPadding: EdgeInsets.only(top: 3, left: 15),
                      labelText: 'Chưa thêm ghi chú cho thợ *',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                         note = value;
                      });
                    },
                  ),
                ),
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tóm tắt đơn hàng'),
                  Container(
                    margin: const EdgeInsets.only(left: 120),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Thêm dịch vụ',
                          style: TextStyle(
                            color: Color(0xff0DB5B4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              _renderCartItems(cart),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng tạm tính'),
                    Text(
                        Utils.formatPrice(Utils.calculatePrice(cart.services))),
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  'Thông tin hóa đơn',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 18),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(
                        currentPayment[currentPaymentIndex],
                      ),
                      height: 38,
                      width: 38,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: Text('Tiền mặt'),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tổng cộng',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      Utils.formatPrice(Utils.calculatePrice(cart.services)),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderCartItems(CartModel cart) {
    List<Widget> list = [];
    if (cart == null) {
      return Container(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "Không có dịch vụ nào trong đơn hàng!",
          style: CustomTextStyle.subtitleText(Colors.black26),
        ),
      );
    }

    cart.services.forEach(
      (item, quantity) => list.add(
        Container(
          height: 90,
          child: CheckoutService(
            model: item,
            quantity: quantity.toString(),
          ),
        ),
      ),
    );
    // return Text(
    //   "Không có dịch vụ nào trong đơn hàng!",
    //   style: CustomTextStyle.subtitleText(Colors.black26),
    // );
    return Column(
      children: list,
    );
  }
}

class CheckoutService extends StatelessWidget {
  final ServiceModel model;
  final String quantity;

  const CheckoutService({Key key, this.model, this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('${this.quantity} x'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Text(model?.serviceName),
                    ),
                    Flexible(
                      child: Text(
                        model.serviceType?.name,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        var provider = context.read<ProviderDetailProvider>();
                        provider.setCurrentService(model);
                        Navigator.pushNamed(
                          context,
                          Routes.serviceDetail,
                          arguments: "From-Checkout",
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 5,
                          top: 3,
                          bottom: 3,
                        ),
                        child: Text(
                          'Chỉnh sửa',
                          style: TextStyle(
                            color: Color(0xff28BEBA),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(_calculatePrice(model?.price.toString(), quantity)),
          ),
        ],
      ),
    );
  }

  String _calculatePrice(String price, String quantity) {
    // if (price == null) return "100.000đ";
    return Utils.formatPrice(
        (double.parse(price) * double.parse(quantity)).toString());
  }
}
