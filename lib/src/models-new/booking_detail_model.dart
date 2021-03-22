import 'dart:convert';
import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'booking_detail_model.g.dart';

@JsonSerializable()
class BookingDetailModel {
  int id;
  int quantity;
  int bookingId;
  int serviceId;
  double servicePrice;
  String serviceName;

  BookingDetailModel({
    this.id,
    this.quantity,
    this.bookingId,
    this.serviceId,
    this.servicePrice,
    this.serviceName,
  });

  factory BookingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingDetailModelToJson(this);
}
