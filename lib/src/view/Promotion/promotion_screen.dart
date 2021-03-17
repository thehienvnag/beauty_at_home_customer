import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/cart_model.dart';
import 'package:flutter_app/src/models-new/voucher_model.dart';
import 'package:flutter_app/src/providers/cart_provider.dart';
import 'package:flutter_app/src/providers/provider_detail_provider.dart';
import 'package:flutter_app/src/providers/voucher_provider.dart';
import 'package:flutter_app/src/view/ServiceDetailScreen/service_detail_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:provider/provider.dart';

class PromotionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var voucher = context.select<VoucherProvider, VoucherModel>(
      (value) => value.currentVoucher,
    );
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
        child: AppBar(
          leading: IconButton(
              icon: Container(
                padding: EdgeInsets.only(left: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_ios),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Image(
            image: NetworkImage(voucher.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
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
            var service = context.read<ProviderDetailProvider>();
            service.setCurrentService(service.getService(0));
            var cartProvider = context.read<CartProvider>();
            cartProvider.setCurrentCart(CartModel(services: Map()));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ServiceDetailScreen(),
              settings: RouteSettings(arguments: "From-Promotion"),
            ));
          },
          backgroundColor: Color(0xff28BEBA),
          label: Text(
            'ÁP DỤNG NGAY',
            style: TextStyle(color: Colors.white, letterSpacing: 4),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
                      child: Text(
                        voucher.title,
                        style: CustomTextStyle.titleText(Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Text(
                            '  ${voucher.description}   (Cách bạn 2.5km)',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Text(
                            '  Cắt da + sơn gel',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_turned_in_outlined,
                          color: Colors.grey,
                        ),
                        Container(
                          child: Text(
                            '  Ưu đãi từ 04/03/2021 đến 04/04/2021',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wallet_giftcard_sharp,
                          color: Colors.orange,
                        ),
                        Container(
                          child: Text(
                            '  ${voucher.priceBefore}',
                            style: CustomTextStyle.subtitleText(Colors.orange),
                          ),
                        ),
                        Container(
                          child: Text(
                            '  ${voucher.priceAfter}',
                            style: CustomTextStyle.subtitleLineThroughText(
                              Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                      child: Text(
                        'ĐIỀU KHOẢN SỬ DỤNG',
                        style: CustomTextStyle.titleText(
                          Color(0xff28BEBA),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.brightness_high_outlined,
                            color: Colors.pink.shade200,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Voucher phải được sử dụng trước thời hạn',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.brightness_high_outlined,
                            color: Colors.pink.shade200,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Đặt lịch sớm để nhận được sự chăm sóc chu đáo nhất của thợ',
                            style: CustomTextStyle.subtitleText(Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
