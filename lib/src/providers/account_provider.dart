import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/services/google_service.dart';
import 'package:flutter_app/src/utils/utils.dart';

class AccountProvider extends ChangeNotifier {
  /* Provider states */
  AccountModel _account;

  /* Screen States */
  bool _isSignIn = false;

  get isSignIn => _isSignIn;
  get accessToken => _account?.accessToken;
  get refreshToken => _account?.firebaseRefreshToken;
  get idToken => _account?.idToken;

  final dynamic fromJson = (dynamic source) => AccountModel.fromJson(source);

  void setUserInfo(data) {}

  Future<void> initData() async {
    _account = await Utils.loadJsonAsset(
      assetsPath: "userProfile.json",
      fromJson: fromJson,
    );
    // log(_account.email + " " + _account.gallery.defaultImage.imageUrl);
    notifyListeners();
  }

  List<ProviderModel> getProviders() {}

  Future<void> login() async {
    User user = await GoogleService.instance().loginWithGoogle();
    log(user.displayName);
    log(await user.getIdToken());
    _isSignIn = true;
    notifyListeners();
  }

  void logOut() async {
    // await GoogleService.instance().logOut();
    _isSignIn = false;
    notifyListeners();
  }
}
