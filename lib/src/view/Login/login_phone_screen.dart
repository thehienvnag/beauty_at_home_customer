import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/UpdateProfile/update_profile_creen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../HomeScreen/home_screen.dart';

class LoginPhoneScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LoginPhoneScreen> {
  TextEditingController _controller = TextEditingController();
  bool isClick = true;
  String phoneNumber = "";
  String numberVerifi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff2AD4D3),
          title: Text(
            'Đăng Nhập',
            style: CustomTextStyle.headerText(Colors.white),
          ),
          leading: IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: isClick
            ? Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Center(
                          child: Text(
                        'Nhập số điện thoại của bạn',
                        style: CustomTextStyle.titleText(Colors.black87),
                      )),
                      Container(
                        margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              phoneNumber = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle:
                                CustomTextStyle.subtitleText(Colors.black45),
                            prefix: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text('+84'),
                            ),
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      SizedBox(height: 29),
                      GestureDetector(
                        onTap: () {
                          if (phoneNumber.isNotEmpty &&
                              phoneNumber.length > 8) {
                            setState(() {
                              isClick = false;
                            });
                          }
                        },
                        child: Container(
                          width: 293,
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 63,
                              vertical: 13,
                            ),
                            child: SizedBox(
                              width: 167,
                              height: 19,
                              child: Text(
                                "Gửi SMS",
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.titleText(Colors.white),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff2AD4D3),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Center(
                          child: Text(
                        'Nhập mã xác nhận',
                        style: CustomTextStyle.titleText(Colors.black87),
                      )),
                      Center(
                          child: Container(
                        margin: EdgeInsets.only(top: 20, left: 80),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  '+84 ${phoneNumber}',
                                  style: CustomTextStyle.titleText(
                                    Color(0xff2AD4D3),
                                  ),
                                )),
                          ],
                        ),
                      )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 45,
                        margin: EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              numberVerifi = value;
                            });
                          },
                          keyboardType: TextInputType.number,
                          cursorHeight: 25,
                          cursorWidth: 3,
                          cursorColor: Colors.lightBlueAccent,
                          decoration: InputDecoration(
                            hintText: 'Nhập mã xác nhận ở điện thoại',
                            hintStyle:
                                CustomTextStyle.subtitleText(Colors.black45),
                            contentPadding: EdgeInsets.only(top: 3, left: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (numberVerifi.isNotEmpty &&
                              numberVerifi.length > 5) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfileAddScreen()));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 35,
                          padding: EdgeInsets.only(top: 7),
                          child: Text(
                            "TIẾP TỤC",
                            textAlign: TextAlign.center,
                            style: CustomTextStyle.titleText(Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xff2AD4D3),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(top: 20),
                      //     child: Center(
                      //         child: Text(
                      //       'Tôi chưa nhận được mã',
                      //       style: TextStyle(
                      //           fontSize: 18, color: Color(0xff2AD4D3)),
                      //     ))),
                      // Container(
                      //     margin: EdgeInsets.only(top: 20),
                      //     child: Center(
                      //         child: Text(
                      //       'Yêu cầu hỗ trợ từ Prettier',
                      //       style: TextStyle(
                      //           fontSize: 18, color: Color(0xff2AD4D3)),
                      //     ))),
                    ],
                  ),
                ),
              ));
  }
}
