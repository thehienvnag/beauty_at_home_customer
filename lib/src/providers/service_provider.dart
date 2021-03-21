import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/service_model_new.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceModelNew _service;
  ServiceModelNew get service => _service;

  void initServiceById(String id) async {
    final fromJson =
        (Map<String, dynamic> source) => ServiceModelNew.fromJson(source);
    _service = await SimpleAPI.getById(
      EntityEndpoint.SERIVCE,
      id,
      fromJson: fromJson,
    );
    log(_service.gallery.images.first.imageUrl);
    notifyListeners();
  }

  // void initServiceList() async {
  //   final fromMap = (source) => ServiceModelNew.fromMap(source);
  //   List<ServiceModelNew> list = await SimpleAPI.getAll<ServiceModelNew>(
  //       EntityEndpoint.SERIVCE,
  //       fromMap: fromMap);
  //   log(list[0].serviceName);
  //   notifyListeners();
  // }
}
