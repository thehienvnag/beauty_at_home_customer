import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class Login_screen extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login_screen> {
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        isSignIn ? Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen()))
        :
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.withOpacity(
                                0.2), width: 2,),
                            right: BorderSide(color: Colors.grey.withOpacity(
                                0.2), width: 2,),
                            top: BorderSide(color: Colors.grey.withOpacity(0.2),
                              width: 2,),
                            left: BorderSide(color: Colors.grey.withOpacity(
                                0.2), width: 2,),
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('public/img/logoBr.png',),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Dành cho người thích làm đẹp',style: TextStyle(fontSize: 25, fontFamily: 'Italy'),),
                    SizedBox(height: 50,),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(4),
                      child: OutlineButton.icon(
                        label: Text('Đăng nhập với Google', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        shape: StadiumBorder(),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        highlightedBorderColor: Colors.black,
                        borderSide: BorderSide(color: Colors.black),
                        textColor: Colors.black,
                        icon: FaIcon(
                          FontAwesomeIcons.google, color: Colors.red,),
                        onPressed: () {
                          handleSignIn();
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    FacebookSignupButtonWibget(),
                    SizedBox(height: 10,),
                    PhoneSignupButtonWibget()
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  Future<void> handleSignIn() async {

    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));

      setState(() {
        isSignIn = true;
      });

      return '$user';
    }
  }

  Future<void> gooleSignout() async {

    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = true;
      });
    });
  }
}


class FacebookSignupButtonWibget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(
        label: Text('Đăng nhập với Facebook',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        highlightedBorderColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        textColor: Colors.black,
        icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.indigoAccent,),
        onPressed: () {

        },
      ),

    );
  }
}

class PhoneSignupButtonWibget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: OutlineButton.icon(
        label: Text('Đăng nhập với điện thoại',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        highlightedBorderColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        textColor: Colors.black,
        icon: FaIcon(FontAwesomeIcons.phone, color: Colors.blue,),
        onPressed: () {

        },
      ),

    );
  }
}
