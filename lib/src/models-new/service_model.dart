import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:flutter_app/src/models-new/service_type_model.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';

class ServiceModel {
  String serviceName;
  String description;
  String price;
  int estimateTime;
  String status;
  ServiceTypeModel serviceType;
  GalleryModel gallery;
  bool isServiceCombo;
  String summary;

  ServiceModel({
    this.serviceName,
    this.description,
    this.price,
    this.estimateTime,
    this.status,
    this.serviceType,
    this.gallery,
    this.isServiceCombo,
    this.summary,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return new ServiceModel(
      serviceName: map['serviceName'] as String,
      description: map['description'] as String,
      price: map['price'].toString(),
      estimateTime: map['estimateTime'] as int,
      status: map['status'] as String,
      serviceType: ServiceTypeModel.fromMap(map['serviceType']),
      gallery: GalleryModel.fromMap(map['gallery']),
      isServiceCombo: map['isServiceCombo'] as bool,
      summary: map['summary'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'serviceName': this.serviceName,
      'description': this.description,
      'price': this.price,
      'estimateTime': this.estimateTime,
      'status': this.status,
      'serviceType': this.serviceType,
      'gallery': this.gallery,
      'isServiceCombo': this.isServiceCombo,
      'summary': this.summary,
    } as Map<String, dynamic>;
  }

  String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source));

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': serviceName,
  //     'description': description,
  //     'price': price,
  //     'estimateTime': estimateTime,
  //     'status': status,
  //     'category': category,
  //     'imageUrl': imageUrl,
  //     'serviceImages': serviceImages,
  //     'isServiceCombo': isServiceCombo,
  //     'summary': summary,
  //   };
  // }
  //
  // factory ServiceModel.fromMap(Map<String, dynamic> map) {
  //   return ServiceModel(
  //     name: map['name'],
  //     description: map['description'],
  //     price: map['price'].toString(),
  //     estimateTime: map['estimateTime'],
  //     status: map['status'],
  //     category: map['category'],
  //     imageUrl: map['imageUrl'],
  //     serviceImages: List<String>.from(map['serviceImages']),
  //     isServiceCombo: map['isServiceCombo'],
  //     summary: map['summary'],
  //   );
  // }


}
