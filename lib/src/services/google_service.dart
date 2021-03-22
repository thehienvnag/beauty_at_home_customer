import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/utils/widgets_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  static GoogleService _instance;
  static GoogleService instance() {
    if (_instance == null) {
      _instance = GoogleService();
    }
    return _instance;
  }

  GoogleSignIn _googleSignIn;

  Future<User> loginWithGoogle() async {
    _googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    log(googleSignInAuthentication.idToken);
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return result.user;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}
