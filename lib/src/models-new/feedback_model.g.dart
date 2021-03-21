// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) {
  return FeedbackModel(
    username: json['username'] as String,
    rateScore: (json['rateScore'] as num)?.toDouble(),
    userImage: json['userImage'] as String,
    imageUrl: (json['imageUrl'] as List)?.map((e) => e as String)?.toList(),
    feedback: json['feedback'] as String,
    commentedDate: json['commentedDate'] as String,
  );
}

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'rateScore': instance.rateScore,
      'userImage': instance.userImage,
      'imageUrl': instance.imageUrl,
      'feedback': instance.feedback,
      'commentedDate': instance.commentedDate,
    };
