// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return AccountModel(
    uid: json['uid'] as int,
    displayName: json['displayName'] as String,
    expiresIn: json['expiresIn'] as String,
    email: json['email'] as String,
    role: json['role'] as String,
    phone: json['phone'] as String,
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    idToken: json['idToken'] as String,
    firebaseRefreshToken: json['firebaseRefreshToken'] as String,
    gallery: json['gallery'] == null
        ? null
        : GalleryModel.fromJson(json['gallery'] as Map<String, dynamic>),
    addresses: (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'displayName': instance.displayName,
      'email': instance.email,
      'role': instance.role,
      'phone': instance.phone,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'idToken': instance.idToken,
      'firebaseRefreshToken': instance.firebaseRefreshToken,
      'expiresIn': instance.expiresIn,
      'gallery': instance.gallery,
      'addresses': instance.addresses,
    };
