import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';

class ServiceModelNew {
  String serviceName;
  String description;
  String summary;
  String price;
  GalleryModel gallery;

  ServiceModelNew({
    this.serviceName,
    this.description,
    this.summary,
    this.price,
    this.gallery,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceName': serviceName,
      'description': description,
      'summary': summary,
      'price': price,
      'gallery': gallery.toMap(),
    };
  }

  factory ServiceModelNew.fromMap(Map<String, dynamic> map) {
    return ServiceModelNew(
      serviceName: map['serviceName'],
      description: map['description'],
      summary: map['summary'],
      price: map['price'],
      gallery: GalleryModel.fromMap(map['gallery']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceModelNew.fromJson(String source) =>
      ServiceModelNew.fromMap(json.decode(source));
}
