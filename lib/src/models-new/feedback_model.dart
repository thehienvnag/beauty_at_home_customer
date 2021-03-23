import 'dart:convert';
import 'package:flutter_app/src/models-new/booking_detail_model.dart';
import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback_model.g.dart';

@JsonSerializable()
class FeedbackModel {
  String username;
  double rateScore;
  String userImage;
  GalleryModel gallery;
  String feedbackContent;
  DateTime createDate;
  BookingDetailModel bookingDetail;

  FeedbackModel({
    this.bookingDetail,
    this.username,
    this.rateScore,
    this.userImage,
    this.gallery,
    this.feedbackContent,
    this.createDate,
  });

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
