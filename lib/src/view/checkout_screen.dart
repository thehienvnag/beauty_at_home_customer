import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/payment_screen.dart';
import 'package:flutter_app/src/view/wait_confirm.dart';
import 'package:flutter_app/src/widgets/checkout_screen_widget.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
            Navigator.of(context).push(MaterialPageRoute(
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
                            Text(
                              '5/12 Đường Số 9',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '5/12, Đường Số 9, Long Thạnh Mỹ, Quận 9, Hồ Chí Minh',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 40, bottom: 10, top: 10),
                width: screenSize.width * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chưa thêm ghi chú địa chỉ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Chưa thêm ghi chú cho thợ',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Text(
                        'Sửa',
                        style: TextStyle(
                          color: Color(0xff0DB5B4),
                        ),
                      ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tóm tắt đơn hàng'),
                  Container(
                    margin: const EdgeInsets.only(left: 120),
                    child: Text(
                      'Thêm dịch vụ',
                      style: TextStyle(
                        color: Color(0xff0DB5B4),
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
              CheckoutService(
                name: 'Make-up',
                category: 'Trang điểm dự tiệc',
                price: '300.000',
                quantity: '1',
              ),
              CheckoutService(
                name: 'Làm tóc',
                category: 'Uốn cong',
                price: '300.000',
                quantity: '1',
              ),
              CheckoutService(
                name: 'Make-up',
                category: 'Trang điểm dự tiệc',
                price: '300.000',
                quantity: '1',
              ),
              CheckoutService(
                name: 'Make-up',
                category: 'Trang điểm dự tiệc',
                price: '300.000',
                quantity: '1',
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
                    Text('Tổng tạm tính'),
                    Text('1.200.000'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phí áp dụng '),
                    Text(' 10.000'),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 18),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(
                          currentPayment[0],
                        ),
                        height: 38,
                        width: 38,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: Text('VND 25.000'),
                      ),
                    ],
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
                      '1.210.000 đ',
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
}

final currentPayment = List.from([
  "public/img/momo_icon.png",
  "public/img/iconcash.PNG",
]);

class CheckoutService extends StatelessWidget {
  final String price, quantity, category, name;
  const CheckoutService({
    Key key,
    this.price,
    this.quantity,
    this.category,
    this.name,
  }) : super(key: key);

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
                child: Text('${this.quantity}X'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.name),
                    Text(
                      this.category,
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Chỉnh sửa',
                        style: TextStyle(
                          color: Color(0xff28BEBA),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 27),
            child: Text(this.price),
          ),
        ],
      ),
    );
  }
}
