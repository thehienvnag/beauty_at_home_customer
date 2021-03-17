import 'dart:convert';

import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/models-new/feedback_model.dart';

class ProviderModel {
  String name;
  String description;
  String address;
  String status;
  double rate;
  String reviews;
  String lowerPrice;
  String upperPrice;
  String openTime;
  String closeTime;
  String imageUrl;
  List<ServiceModel> services;
  List<FeedbackModel> feedbacks;
  ProviderModel({
    this.name,
    this.description,
    this.address,
    this.status,
    this.rate,
    this.reviews,
    this.lowerPrice,
    this.upperPrice,
    this.openTime,
    this.closeTime,
    this.imageUrl,
    this.services,
    this.feedbacks,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'address': address,
      'status': status,
      'rate': rate,
      'reviews': reviews,
      'lowerPrice': lowerPrice,
      'upperPrice': upperPrice,
      'openTime': openTime,
      'closeTime': closeTime,
      'imageUrl': imageUrl,
      'services': services?.map((x) => x.toMap())?.toList(),
      'feedbacks': feedbacks?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      name: map['name'],
      description: map['description'],
      address: map['address'],
      status: map['status'],
      rate: map['rate'],
      reviews: map['reviews'],
      lowerPrice: map['lowerPrice'],
      upperPrice: map['upperPrice'],
      openTime: map['openTime'],
      closeTime: map['closeTime'],
      imageUrl: map['imageUrl'],
      services: List<ServiceModel>.from(
          map['services']?.map((x) => ServiceModel.fromMap(x))),
      feedbacks: List<FeedbackModel>.from(
          map['feedbacks']?.map((x) => FeedbackModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderModel.fromJson(String source) =>
      ProviderModel.fromMap(json.decode(source));
}
