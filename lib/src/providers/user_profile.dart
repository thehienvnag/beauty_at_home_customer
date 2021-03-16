import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_profile_model.dart';
import 'package:flutter_app/src/services/google_service.dart';

class UserProfile extends ChangeNotifier {
  /* Provider states */
  UserProfileModel _profile;

  /* Screen States */
  bool _isSignIn = false;

  get isSignIn => _isSignIn;
  get accessToken => _profile?.accessToken;
  get refreshToken => _profile?.firebaseRefreshToken;
  get idToken => _profile?.idToken;

  Future<void> login() async {
    User user = await GoogleService.instance().loginWithGoogle();
    _isSignIn = true;
    notifyListeners();
  }

  void logOut() async {
    await GoogleService.instance().logOut();
    _isSignIn = false;
    notifyListeners();
  }
}
