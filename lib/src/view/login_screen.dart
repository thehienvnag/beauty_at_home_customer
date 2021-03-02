import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login_screen extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Login_screen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;

  GoogleSignIn _googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // isSignIn ? Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => HomeScreen()))
          body: isSignIn
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(_user.photoURL),
                ),
                Text(_user.displayName),
                OutlineButton(
                  onPressed: () {
                    gooleSignout();
                  },
                  child: Text("Logout"),
                )
              ],
            ),
          )
          : Container(
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
                    ],
                  )
                ],
              ),
            ),
          )
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

    UserCredential result = (await _auth.signInWithCredential(credential));

    _user = result.user;

    setState(() {
      isSignIn = true;
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = false;
      });
    });
  }
}

