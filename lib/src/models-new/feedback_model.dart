import 'dart:convert';

class FeedbackModel {
  String username;
  double rateScore;
  String userImage;
  List<String> imageUrl;
  String feedback;
  String commentedDate;

  FeedbackModel({
    this.username,
    this.rateScore,
    this.userImage,
    this.imageUrl,
    this.feedback,
    this.commentedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'rateScore': rateScore,
      'userImage': userImage,
      'imageUrl': imageUrl,
      'feedback': feedback,
      'commentedDate': commentedDate,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      username: map['username'],
      rateScore: map['rateScore'],
      userImage: map['userImage'],
      imageUrl: List<String>.from(map['imageUrl']),
      feedback: map['feedback'],
      commentedDate: map['commentedDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromJson(String source) =>
      FeedbackModel.fromMap(json.decode(source));
}
