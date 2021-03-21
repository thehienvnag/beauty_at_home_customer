// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    id: json['id'] as int,
    location: json['location'] as String,
    locationName: json['locationName'] as String,
    isDefault: json['isDefault'] as bool,
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'locationName': instance.locationName,
      'isDefault': instance.isDefault,
    };
