import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';

class AccountModel {
  String name;
  String email;
  String role;
  String phone;
  String accessToken;
  String refreshToken;
  String idToken;
  String firebaseRefreshToken;
  GalleryModel gallery;
  AccountModel({
    this.name,
    this.email,
    this.role,
    this.phone,
    this.accessToken,
    this.refreshToken,
    this.idToken,
    this.firebaseRefreshToken,
    this.gallery,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'idToken': idToken,
      'firebaseRefreshToken': firebaseRefreshToken,
      'gallery': gallery.toMap(),
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      name: map['name'],
      email: map['email'],
      role: map['role'],
      phone: map['phone'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
      idToken: map['idToken'],
      firebaseRefreshToken: map['firebaseRefreshToken'],
      gallery: GalleryModel.fromMap(map['gallery']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));
}
