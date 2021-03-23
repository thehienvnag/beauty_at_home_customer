import 'dart:convert';

import 'package:flutter_app/src/models-new/gallery_model.dart';
import 'package:flutter_app/src/models-new/image_model.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models-new/service_type_model.dart';
import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:flutter_app/src/widgets/home_screen_widget.dart';
import 'package:json_annotation/json_annotation.dart';
part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  int id;
  String serviceName;
  String description;
  double price;
  int estimateTime;
  String status;
  ServiceTypeModel serviceType;
  GalleryModel gallery;
  bool isServiceCombo;
  String summary;
  ProviderModel account;
  double rateScore;
  double totalFeedback;

  ServiceModel({
    this.id,
    this.rateScore,
    this.totalFeedback,
    this.serviceName,
    this.description,
    this.price,
    this.estimateTime,
    this.status,
    this.serviceType,
    this.gallery,
    this.isServiceCombo,
    this.summary,
    this.account,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
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
