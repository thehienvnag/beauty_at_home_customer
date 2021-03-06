import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/shared_widget/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_screen.dart';
import 'login_phone_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LoginScreen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0DB5B4),
        body: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 250,
                        child:
                            Image(image: AssetImage('public/img/logoBr.png')),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Bring beauty artist to your doorstep',
                          style: CustomTextStyle.titleText(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  loginWithGoogle(),
                  SizedBox(height: 12),
                  loginWithPhone()
                ],
              ),
            ),
          ),
          // Container(
          //   width: 338,
          //   height: 283,
          //   child: Stack(
          //     children: [
          //       Positioned.fill(
          //         child: Align(
          //           alignment: Alignment.bottomLeft,
          //           child: SizedBox(
          //             width: 210,
          //             height: 211,
          //             child: Material(
          //               color: Color(0x7fa5e4e0),
          //               shape: CircleBorder(),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Positioned.fill(
          //         child: Align(
          //           alignment: Alignment.topRight,
          //           child: SizedBox(
          //             width: 197,
          //             height: 192,
          //             child: Material(
          //               color: Color(0x7ca6e4e1).withOpacity(0.5),
          //               shape: CircleBorder(),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ]));
  }

  bool isSignIn = false;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        (await FirebaseAuth.instance.signInWithCredential(credential));

    _user = result.user;

    if (_user.displayName.isNotEmpty) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  Future<void> gooleSignout() async {
    await FirebaseAuth.instance.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }

  Widget loginWithGoogle() {
    return GestureDetector(
      onTap: () {
        handleSignIn();
      },
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
    );
  }

  Widget loginWithPhone() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPhoneScreen()));
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
}
