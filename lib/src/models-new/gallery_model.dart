import 'dart:convert';

import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'gallery_model.g.dart';

@JsonSerializable()
class GalleryModel {
  List<ImageModel> images;
  GalleryModel({
    this.images,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);
}
