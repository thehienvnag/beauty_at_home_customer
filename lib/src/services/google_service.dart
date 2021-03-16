import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
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
  User _user;

  Future<User> loginWithGoogle() async {
    try {
      _googleSignIn = GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      log(_user.email);
    } catch (e) {
      log(e);
    }
    return _user;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
  }
}
