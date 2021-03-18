import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
//import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

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
        elevation: 1,
        title: Column(
          children: [
            Text(
              'Thông báo',
              style: CustomTextStyle.headerText(Colors.black87),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => NetworkGiffyDialog(
              image: Image.asset(
                "public/img/beautician_test.png",
              ),
              title: Text(
                'Makeup cô dâu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Đơn của bạn đã đặt thành công',
                textAlign: TextAlign.center,
              ),
              onOkButtonPressed: () {},
            ),
          );
        },
        label: Text("Notification"),
      ),
      bottomNavigationBar: WidgetUtils.appBottomNavigationBar(2),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: ListView.separated(
          itemCount: 1,
          separatorBuilder: (context, index) => Divider(
            height: 20,
            thickness: 0.5,
            color: Colors.grey,
            indent: 10,
            endIndent: 12,
          ),
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.only(left: 15),
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
        ),
      ),
    );
  }
}
