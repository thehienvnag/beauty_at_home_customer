// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) {
  return ServiceModel(
    id: json['id'] as int,
    rateScore: (json['rateScore'] as num)?.toDouble(),
    totalFeedback: (json['totalFeedback'] as num)?.toDouble(),
    serviceName: json['serviceName'] as String,
    description: json['description'] as String,
    price: (json['price'] as num)?.toDouble(),
    estimateTime: json['estimateTime'] as int,
    status: json['status'] as String,
    serviceType: json['serviceType'] == null
        ? null
        : ServiceTypeModel.fromJson(
            json['serviceType'] as Map<String, dynamic>),
    gallery: json['gallery'] == null
        ? null
        : GalleryModel.fromJson(json['gallery'] as Map<String, dynamic>),
    isServiceCombo: json['isServiceCombo'] as bool,
    summary: json['summary'] as String,
    account: json['account'] == null
        ? null
        : ProviderModel.fromJson(json['account'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceName': instance.serviceName,
      'description': instance.description,
      'price': instance.price,
      'estimateTime': instance.estimateTime,
      'status': instance.status,
      'serviceType': instance.serviceType,
      'gallery': instance.gallery,
      'isServiceCombo': instance.isServiceCombo,
      'summary': instance.summary,
      'account': instance.account,
      'rateScore': instance.rateScore,
      'totalFeedback': instance.totalFeedback,
    };
