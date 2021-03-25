import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'address_model.dart';
part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  int uid;
  String displayName;
  String email;
  String role;
  String phone;
  String accessToken;
  String refreshToken;
  String idToken;
  String firebaseRefreshToken;
  String expiresIn;
  GalleryModel gallery;
  List<AddressModel> addresses;
  AccountModel({
    this.uid,
    this.displayName,
    this.expiresIn,
    this.email,
    this.role,
    this.phone,
    this.accessToken,
    this.refreshToken,
    this.idToken,
    this.firebaseRefreshToken,
    this.gallery,
    this.addresses,
  });
  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
