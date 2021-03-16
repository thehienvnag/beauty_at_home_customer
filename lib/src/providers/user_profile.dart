import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/models/user_profile_model.dart';
import 'package:flutter_app/src/utils/utils.dart';

class UserProfile extends ChangeNotifier {
  /* Provider states */
  AccountModel _account;

  /* Screen States */
  bool _isSignIn = false;

  get isSignIn => _isSignIn;
  get accessToken => _account?.accessToken;
  get refreshToken => _account?.firebaseRefreshToken;
  get idToken => _account?.idToken;

  AccountModel fromJson(Map<String, dynamic> json) {
    return AccountModel.fromJson(json);
  }

  Future<void> login() async {
    // User user = await GoogleService.instance().loginWithGoogle();

    _account = await Utils.loadJsonAsset(
      assetsPath: "userProfile.json",
      fromJson: fromJson,
    );
    log(_account.email);
    _isSignIn = true;
    notifyListeners();
  }

  void logOut() async {
    // await GoogleService.instance().logOut();
    _isSignIn = false;
    notifyListeners();
  }
}
