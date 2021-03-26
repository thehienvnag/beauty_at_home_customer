import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/apis/provider_api/simple_api.dart';
import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/models-new/service_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';

class ProviderDetailProvider extends ChangeNotifier {
  ProviderModel _provider;
  ServiceModel _currentService;
  List<ServiceModel> _services;

  List<ProviderModel> _listProviderHome;
  List<ProviderModel> get listProviderHome => _listProviderHome;

  ProviderModel get provider => _provider;

  List<ServiceModel> get services => _services;

  ServiceModel get currentService => _currentService;

  bool _isLoadingCurrentService = false;
  bool get isLoadingCurrentService => _isLoadingCurrentService;

  // List<FeedbackModel> get feedbacks => _provider.feedbacks;

  ServiceModel getService(index) => _provider.services[index];

  void initProvider(String id) async {
    final fromJson = (source) => ProviderModel.fromJson(source);
    final fromServiceJson = (source) => ServiceModel.fromJson(source);
    // _provider = fake;
    _provider = await SimpleAPI.getById(
      ProviderAPIConstant.PROVIDER,
      id,
      fromJson: fromJson,
      queryParameters: {
        "withRateScore": "true",
      },
    );
    _services = await SimpleAPI.getAll<ServiceModel>(ServiceAPIConstant.SERVICE,
        queryParameters: {"AccountId": id, "Status" : "true"}, fromJson: fromServiceJson);
    if (_services != null && _services.isNotEmpty) {
      double lowerPrice = 999999;
      double upperPrice = 0;
      _services.forEach((element) {
        if (element.price > upperPrice) {
          upperPrice = element.price;
        }
        if (element.price < lowerPrice) {
          lowerPrice = element.price;
        }
        _provider.lowerPrice = lowerPrice.toString();
        _provider.upperPrice = upperPrice.toString();
      });
    }
    notifyListeners();
  }

  void setCurrentService(ServiceModel serviceModel) {
    _currentService = serviceModel;
    notifyListeners();
  }

  void initServiceById(String id) async {
    _isLoadingCurrentService = true;
    _currentService = await SimpleAPI.getById(
      EntityEndpoint.SERIVCE,
      id,
      fromJson: (json) => ServiceModel.fromJson(json),
    );
    _isLoadingCurrentService = false;
    log("===========" + _currentService.serviceName);
    notifyListeners();
  }

  void initProviderListHome() async {
    final fromJson = (source) => ProviderModel.fromJson(source);
    _listProviderHome = await SimpleAPI.getAll<ProviderModel>(
      ProviderAPIConstant.PROVIDER,
      fromJson: fromJson,
      queryParameters: {
        "isBeautyArtist": "true",
        "withRateScore": "true",
      },
    );
    notifyListeners();
  }

  List<ProviderModel> _listProvidersSearch;
  List<ProviderModel> get listProvidersSearch => _listProvidersSearch;

  void initProviderListSearch(String searchQuery) async {
    final fromJson = (source) => ServiceModel.fromJson(source);
    _services = await SimpleAPI.getAll<ServiceModel>(
      "services",
      fromJson: fromJson,
      queryParameters: {
        "isBeautyArtist": "true",
        "withRateScore": "true",
        "searchQuery": searchQuery,
      },
    );
    log(_services.length.toString());

    List<ProviderModel> providersXXX = [];
    List<ServiceModel> servicesXXX = [];
    _services.forEach((element) {
      if(element.status =='ACTIVE' || element.status =='Active'){
        servicesXXX.add(element);
      }
      providersXXX.add(element.account);
    });

    providersXXX.forEach((provi) {
      servicesXXX.forEach((srv) {
        if (provi.services == null) {
          provi.services = [];
        }
        if (srv.account.id == provi.id) {
          provi.services.add(srv);
        }
      });
    });

    final ids = providersXXX.map((e) => e.id).toSet();
    providersXXX.retainWhere((x) => ids.remove(x.id));

    _listProvidersSearch = providersXXX;

    notifyListeners();
  }
}
