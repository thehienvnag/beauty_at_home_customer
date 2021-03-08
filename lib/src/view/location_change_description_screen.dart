import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/detail_screen_appbar.dart';

class LocationChangeDescriptionScreen extends StatelessWidget {
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
            'LƯU ĐỊA CHỈ',
            style: TextStyle(color: Colors.white, letterSpacing: 4),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            Text(
              'Thêm vào địa điểm đã lưu',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Divider(
                height: 8,
                thickness: 0.5,
                color: Colors.grey,
                indent: 12,
                endIndent: 10,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 100),
            //   child: Divider(
            //     height: 8,
            //     thickness: 0.5,
            //     color: Colors.grey,
            //     indent: 12,
            //     endIndent: 10,
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'Tên',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                //margin: const EdgeInsets.only(left: 10, bottom: 15),
                width: screenSize.width * 0.9,
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 8, right: 10, left: 10),
                    hintText: 'Ví dụ: Nhà ở, Trường học',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 5),
              child: Text(
                'Đặt tên cho địa chỉ này để sử dụng vào lần sau',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'Địa chỉ',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 16, bottom: 10),
              width: screenSize.width * 0.91,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xff0DB5B4),
                      ),
                      Text(
                        '  7-Eleven - Lô E2A Đường D1',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Lô E2A Đường D1, Khu Công Nghệ Cao',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                'Địa chỉ chi tiết',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                //margin: const EdgeInsets.only(left: 10, bottom: 15),
                width: screenSize.width * 0.9,
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 8, right: 10, left: 10),
                    hintText: 'Ví dụ: Tên tòa nhà / địa điểm gần đó',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 5),
              child: Text(
                'Nhập chi tiết địa chỉ thợ đến',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                'Ghi chú cho tài xế',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                //margin: const EdgeInsets.only(left: 10, bottom: 15),
                width: screenSize.width * 0.9,
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 8, right: 10, left: 10),
                    hintText: 'Chỉ dẫn chi tiết địa điểm cho thợ',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.2),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                'Ghi chú thêm lưu ý để thợ đến hoặc hướng dẫn đường đi tại đây',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
