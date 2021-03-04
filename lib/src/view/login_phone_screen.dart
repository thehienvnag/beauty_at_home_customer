import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_screen.dart';

class Login_phone_screen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Login_phone_screen> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  GoogleSignIn _googleSignIn = new GoogleSignIn();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Nhập'),
      ),
        body:
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[

                SizedBox(height: 10),
                Center(child: Text('Nhập số điện thoại của bạn')),
                Container(
                  margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+1'),
                      ),
                    ),
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                  ),
                )
              ],
            ),
          ),
        ),
    );
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

    // setState(() {
    //   isSignIn = true;
    // });
    if(_user.displayName.isNotEmpty){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4),
          child: OutlineButton.icon(
            label: Text(
              'Đăng nhập với Google',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            highlightedBorderColor: Colors.black,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            onPressed: () {
              handleSignIn();
            },
          ),
        ),
      ],
    );
  }
  Widget loginWithPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4),
          child: OutlineButton.icon(
            label: Text(
              'Đăng nhập với điện thoại',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            highlightedBorderColor: Colors.black,
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            icon: FaIcon(
              FontAwesomeIcons.phone,
              color: Colors.lightBlue,
            ),
            onPressed: () {
// handleSignIn();
            },
          ),
        ),
      ],
    );
  }
}
