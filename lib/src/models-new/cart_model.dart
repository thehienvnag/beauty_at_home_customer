import 'package:flutter_app/src/models-new/service_model.dart';

class CartModel {
  String providerName;
  String note;
  String beautyArtistAccountId;
  String customerAccountId;
  String providerImage;

  Map<ServiceModel, int> services;

  CartModel(
      {this.beautyArtistAccountId,
      this.customerAccountId,
      this.providerName,
      this.services,
      this.note,
      this.providerImage}) {
    if (services == null) {
      services = Map();
    }
  }
}
