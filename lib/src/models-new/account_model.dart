import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'account_model.g.dart';

@JsonSerializable()
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
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
