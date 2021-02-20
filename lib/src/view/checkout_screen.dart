import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/payment_screen.dart';

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
          onPressed: () {},
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
          child: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(21),
              child: Divider(
                height: 20,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              children: [
                Text(
                  'Makeup Hoàng Gia',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  'Khoảng cách tới chỗ bạn: 4,9 km',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ],
            ),
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage('public/img/meo.jpg'),
                radius: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
              )
            ],
          ),
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
                    margin: const EdgeInsets.only(left: 160),
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
              Row(
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
                        child: Text('1X'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Make-up'),
                            Text(
                              'Trang điểm dự tiệc',
                              style: TextStyle(color: Colors.grey),
                            ),
                            FlatButton(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
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
                    child: Text('300.000'),
                  ),
                ],
              ),
              Row(
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
                        child: Text('1X'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Làm tóc'),
                            Text(
                              'Uốn cong',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              //style: ButtonStyle(padding: const EdgeInsets.all(0),),
                              onPressed: () {},
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
                    child: Text('300.000'),
                  ),
                ],
              ),
              Row(
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
                        child: Text('1X'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Làm tóc'),
                            Text(
                              'Uốn cong',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              //style: ButtonStyle(padding: const EdgeInsets.all(0),),
                              onPressed: () {},
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
                    child: Text('300.000'),
                  ),
                ],
              ),
              Row(
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
                        child: Text('1X'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Làm tóc'),
                            Text(
                              'Uốn cong',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              //style: ButtonStyle(padding: const EdgeInsets.all(0),),
                              onPressed: () {},
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
                    child: Text('300.000'),
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
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text('Tổng tạm tính'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 200),
                    child: Text('500.000'),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text('Phí áp dụng '),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 214),
                    child: Text(' 10.000'),
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
              Container(
                margin: const EdgeInsets.only(left: 20),
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
                          'public/img/momo_icon.png',
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
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Tổng cộng',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 190),
                    child: Text(
                      '510.000 đ',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
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
