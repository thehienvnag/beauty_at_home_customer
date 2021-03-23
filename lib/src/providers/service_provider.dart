import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceModel _service;
  ServiceModel get service => _service;

  List<ServiceModel> _listServiceHome;
  List<ServiceModel> get listServiceHome => _listServiceHome;

  void initServiceById(String id) async {
    final fromJson =
        (Map<String, dynamic> source) => ServiceModel.fromJson(source);
    _service = await SimpleAPI.getById(
      EntityEndpoint.SERIVCE,
      id,
      fromJson: fromJson,
    );
    notifyListeners();
  }

  void initServiceList() async {
    final fromMap = (source) => ServiceModel.fromJson(source);
    List<ServiceModel> list = await SimpleAPI.getAll<ServiceModel>(
        EntityEndpoint.SERIVCE,
        fromJson: fromMap);
    log(list[0].serviceName);
    notifyListeners();
  }

  void initServiceListHome() async {
    final fromJson = (source) => ServiceModel.fromJson(source);
    _listServiceHome = await SimpleAPI.getAll<ServiceModel>(
      EntityEndpoint.SERIVCE,
      fromJson: fromJson,
      queryParameters: {"pageSize": "5"},
    );
    log(_listServiceHome[0].serviceName);
    notifyListeners();
  }
}
