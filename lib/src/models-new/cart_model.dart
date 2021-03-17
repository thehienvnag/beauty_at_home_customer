import 'package:flutter_app/src/models-new/service_model.dart';

class CartModel {
  String providerName;
  String note;
  
  Map<ServiceModel, int> services;
  CartModel({
    this.services,
    this.note,
  });
}
