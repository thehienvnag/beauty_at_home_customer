import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_profile_model.dart';
import 'package:flutter_app/src/services/google_service.dart';

class UserProfile extends ChangeNotifier {
  /* Provider states */
  UserProfileModel _profile;
  String _idToken;
  String _refreshToken;
  bool _isSignIn = false;

  get isSignIn => _isSignIn;

  Future<void> login() async {
    await GoogleService.instance().loginWithGoogle();
    _isSignIn = true;
    notifyListeners();
  }

  void logOut() async {
    await GoogleService.instance().loginWithGoogle();
    _isSignIn = false;
    notifyListeners();
  }
}
