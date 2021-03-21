// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model_new.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModelNew _$ServiceModelNewFromJson(Map<String, dynamic> json) {
  return ServiceModelNew(
    serviceName: json['serviceName'] as String,
    description: json['description'] as String,
    summary: json['summary'] as String,
    price: (json['price'] as num)?.toDouble(),
    gallery: json['gallery'] == null
        ? null
        : GalleryModel.fromJson(json['gallery'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceModelNewToJson(ServiceModelNew instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'description': instance.description,
      'summary': instance.summary,
      'price': instance.price,
      'gallery': instance.gallery,
    };
