import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ImageModel {
  String imageUrl;
  ImageModel({
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));
}
