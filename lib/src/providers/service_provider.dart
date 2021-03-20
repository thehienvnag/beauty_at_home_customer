import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/models-new/service_model_new.dart';

class ServiceProvider extends ChangeNotifier {
  ServiceModelNew _service;
  ServiceModelNew get service => _service;

  void initServiceById(String id) {}
}
