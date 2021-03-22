import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/services/google_service.dart';
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

  List<ProviderModel> getProviders() {}

  Future<void> login() async {
    User user = await GoogleService.instance().loginWithGoogle();
    String idToken = await user.getIdToken();
    _accountSignedIn = await SimpleAPI.login({
      "idToken": idToken,
      "displayName": user.displayName,
      "avatar": user.photoURL,
    });
    _accountSignedIn.firebaseRefreshToken = user.refreshToken;
    _accountSignedIn.idToken = idToken;
    _accountSignedIn.gallery = GalleryModel(images: [
      ImageModel(imageUrl: user.photoURL),
    ]);
    if (_accountSignedIn != null) {
      _isSignIn = true;
    }
    log(_accountSignedIn.uid.toString());
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
