// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDetailModel _$BookingDetailModelFromJson(Map<String, dynamic> json) {
  return BookingDetailModel(
    id: json['id'] as int,
    booking: json['booking'] == null
        ? null
        : BookingModel.fromJson(json['booking'] as Map<String, dynamic>),
    quantity: json['quantity'] as int,
    serviceId: json['serviceId'] as int,
    servicePrice: (json['servicePrice'] as num)?.toDouble(),
    serviceName: json['serviceName'] as String,
  );
}

Map<String, dynamic> _$BookingDetailModelToJson(BookingDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'serviceId': instance.serviceId,
      'servicePrice': instance.servicePrice,
      'serviceName': instance.serviceName,
      'booking': instance.booking,
    };
