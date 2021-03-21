import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'service_model_new.g.dart';

@JsonSerializable()
class ServiceModelNew {
  String serviceName;
  String description;
  String summary;
  double price;
  GalleryModel gallery;

  ServiceModelNew({
    this.serviceName,
    this.description,
    this.summary,
    this.price,
    this.gallery,
  });

  factory ServiceModelNew.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelNewFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelNewToJson(this);
}
