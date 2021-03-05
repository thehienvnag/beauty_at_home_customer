import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        body: Stack(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 70),
        color: Colors.white,
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
                    child: Image(image: AssetImage('public/img/logo6.png')),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Đăng nhập để làm đẹp ngay',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              loginWithGoogle(),
              SizedBox(height: 10),
              loginWithPhone()
            ],
          ),
        ),
      ),
      Container(
        width: 338,
        height: 283,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 210,
                  height: 211,
                  child: Material(
                    color: Color(0x7fa5e4e0),
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  width: 197,
                  height: 192,
                  child: Material(
                    color: Color(0x7ca6e4e1).withOpacity(0.5),
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
        height: 10.0 * 5.5,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: <Widget>[
            Icon(FontAwesomeIcons.google,
                size: 10.0 * 2.5, color: Colors.red.withOpacity(0.6)),
            SizedBox(width: 10.0 * 1.5),
            Text('Đăng nhập với Google',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
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
        height: 10.0 * 5.5,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.phone, size: 10.0 * 2.5, color: Color(0xff28BEBA)),
            SizedBox(width: 10.0 * 1.5),
            Text('Đăng nhập với điện thoại',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
