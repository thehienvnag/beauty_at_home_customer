import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_app/src/models-new/booking_detail_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel {
  int id;
  String status;
  DateTime createDate;
  ProviderModel customerAccount;
  ProviderModel beautyArtistAccount;
  String note;
  String endAddress;
  String beginAddress;
  double totalFee;
  double transportFee;
  List<BookingDetailModel> bookingDetails;

  BookingModel({
    this.id,
    this.status,
    this.createDate,
    this.customerAccount,
    this.beautyArtistAccount,
    this.note,
    this.endAddress,
    this.beginAddress,
    this.totalFee,
    this.transportFee,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
