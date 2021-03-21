// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) {
  return ProviderModel(
    id: json['id'] as int,
    displayName: json['displayName'] as String,
    description: json['description'] as String,
    addresses: (json['addresses'] as List)
        ?.map((e) =>
            e == null ? null : AddressModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    rate: (json['rate'] as num)?.toDouble(),
    reviews: json['reviews'] as String,
    lowerPrice: json['lowerPrice'] as String,
    upperPrice: json['upperPrice'] as String,
    gallery: json['gallery'] == null
        ? null
        : GalleryModel.fromJson(json['gallery'] as Map<String, dynamic>),
    services: (json['services'] as List)
        ?.map((e) =>
            e == null ? null : ServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProviderModelToJson(ProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'description': instance.description,
      'addresses': instance.addresses,
      'status': instance.status,
      'rate': instance.rate,
      'reviews': instance.reviews,
      'lowerPrice': instance.lowerPrice,
      'upperPrice': instance.upperPrice,
      'gallery': instance.gallery,
      'services': instance.services,
    };
