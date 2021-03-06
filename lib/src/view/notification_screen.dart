import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Thông báo',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(2),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
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
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 10,
              endIndent: 12,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.3,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('public/img/notification.PNG'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 18),
                    child: Text('Đơn hàng của bạn đã được chấp nhận'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.grey,
              indent: 12,
              endIndent: 10,
            ),
          ],
        ),
      ),
    );
  }
}
