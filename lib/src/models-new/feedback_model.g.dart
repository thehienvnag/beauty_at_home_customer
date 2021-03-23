// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) {
  return FeedbackModel(
    bookingDetail: json['bookingDetail'] == null
        ? null
        : BookingDetailModel.fromJson(
            json['bookingDetail'] as Map<String, dynamic>),
    username: json['username'] as String,
    rateScore: (json['rateScore'] as num)?.toDouble(),
    userImage: json['userImage'] as String,
    gallery: json['gallery'] == null
        ? null
        : GalleryModel.fromJson(json['gallery'] as Map<String, dynamic>),
    feedbackContent: json['feedbackContent'] as String,
    createDate: json['createDate'] == null
        ? null
        : DateTime.parse(json['createDate'] as String),
  );
}

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'rateScore': instance.rateScore,
      'userImage': instance.userImage,
      'gallery': instance.gallery,
      'feedbackContent': instance.feedbackContent,
      'createDate': instance.createDate?.toIso8601String(),
      'bookingDetail': instance.bookingDetail,
    };
