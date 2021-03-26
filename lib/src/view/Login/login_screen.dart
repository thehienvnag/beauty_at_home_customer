import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:flutter_app/src/utils/routes_name.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:flutter_app/src/view/HomeScreen/home_screen.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0DB5B4),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 290,
                        height: 200,
                        child:
                            Image(image: AssetImage('public/img/logoBr.png')),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Làm đẹp ngay tại ngôi nhà của bạn',
                          style: CustomTextStyle.titleText(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  _loginWithGoogle(context),
                  // SizedBox(height: 12),
                  // _loginWithPhone(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginWithGoogle(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final userProfile = context.read<AccountProvider>();
        WidgetUtils.showDialogStatic(
          context,
          title: "Đăng nhập sử dụng tài khoản Google",
        );
        await userProfile.login();
        if (userProfile.isSignIn) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        } else {
          // Navigator.of(context).pop();
          // WidgetUtils.showSnackBar(
          //   context,
          //   content: Text("Tài khoản đã không hợp lệ, vui lòng thử lại!"),
          //   actionLabel: "Thử lại",
          // );
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                    content: Text(
                      "Tài khoản của bạn không hợp lệ, vui lòng thử lại!",
                    ),
                    actions: [
                      FlatButton(
                        textColor: Color(0xFF6200EE),
                        onPressed: () {
                          gooleSignout();
                          Navigator.of(context).pop();
                        },
                        child: Text('Thử lại'),
                      ),
                    ]);
              });
        }
      },
      child: GestureDetector(
        child: Container(
          height: 45,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.google,
                size: 10.0 * 2.5,
                color: Colors.red.withOpacity(0.6),
              ),
              SizedBox(width: 30),
              Text(
                'Đăng nhập với Google',
                style: CustomTextStyle.titleText(Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginWithPhone(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.loginPhone);
      },
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Icon(Icons.phone, size: 10.0 * 2.5, color: Color(0xff28BEBA)),
            SizedBox(width: 30),
            Text(
              'Đăng nhập với điện thoại',
              style: CustomTextStyle.titleText(Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gooleSignout() async {
    GoogleSignIn _googleSignIn = new GoogleSignIn();
    await FirebaseAuth.instance.signOut().then((onValue) {
      _googleSignIn.signOut();
    });
  }
}
