import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/services/google_service.dart';
import 'package:flutter_app/src/services/secured_storage.dart';
import 'package:flutter_app/src/utils/api_constants.dart';
import 'package:flutter_app/src/utils/utils.dart';
import 'package:geocoder/geocoder.dart';

class AccountProvider extends ChangeNotifier {
  /* Provider states */
  AccountModel _accountSignedIn;
  AccountModel get accountSignedIn => _accountSignedIn;

  String _currentAddress;
  Coordinates _location;
  String get currentAddress => _currentAddress;
  Coordinates get location => _location;

  /* Screen States */
  bool _isSignIn = false;

  get isSignIn => _isSignIn;

  final dynamic fromJson = (dynamic source) => AccountModel.fromJson(source);

  void setUserInfo(data) {}

  Future<void> initData() async {
    // log(_account.email + " " + _account.gallery.defaultImage.imageUrl);
    notifyListeners();
  }

  Future<void> login() async {
    _isSignIn = false;
    User user = await GoogleService.instance().loginWithGoogle();
    String idToken = await user.getIdToken();
    _accountSignedIn = await SimpleAPI.login({
      "idToken": idToken,
      "displayName": user.displayName,
      "avatar": user.photoURL,
      "loginType": "CUSTOMER",
    });

    if (_accountSignedIn != null) {
      _accountSignedIn.firebaseRefreshToken = user.refreshToken;
      _accountSignedIn.idToken = idToken;

      _isSignIn = true;
      AppStorageService.writeDataMap({
        StorageConst.idToken: idToken,
        StorageConst.accessToken: _accountSignedIn.accessToken,
        StorageConst.firebaseRefreshToken: user.refreshToken,
      });
      log("Id Token: " +
          await AppStorageService.readData(StorageConst.idToken));
      log("Access Token: " +
          await AppStorageService.readData(StorageConst.accessToken));
      log("Firebase Access Token: " +
          await AppStorageService.readData(StorageConst.firebaseRefreshToken));
      log(_accountSignedIn.uid.toString());
    }

    notifyListeners();
  }

  void setCurrentAddress(String address, Coordinates location) {
    _currentAddress = address;
    _location = location;
    notifyListeners();
  }

  void logOut() async {
    // await GoogleService.instance().logOut();
    _isSignIn = false;
    notifyListeners();
  }
}
