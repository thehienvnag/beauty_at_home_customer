import 'dart:convert';

import 'package:flutter_app/src/models-new/image_model.dart';

class GalleryModel {
  ImageModel defaultImage;
  GalleryModel({
    this.defaultImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'defaultImage': defaultImage.toMap(),
    };
  }

  factory GalleryModel.fromMap(Map<String, dynamic> map) {
    return GalleryModel(
      defaultImage: ImageModel.fromMap(map['defaultImage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GalleryModel.fromJson(String source) =>
      GalleryModel.fromMap(json.decode(source));
}
