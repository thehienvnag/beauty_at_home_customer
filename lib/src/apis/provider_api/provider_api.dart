import 'dart:convert';

import 'package:flutter_app/src/models-new/provider_detail_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class ProviderAPI {
  String url = ProviderAPIConstant.END_POINT;

  Future<ProviderModel> getProviderById(
      Function(String) onError, String id) async {
    String endpoint = url + "/$id";
    ProviderModel providerModel;
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        providerModel = ProviderModel.fromJson(response.body);
      } catch (e) {
        onError("GetProviderById{$id}: error in try catch");
        print(e);
      }
    } else {
      onError("GetProviderById{$id}: error Status code ${response.statusCode}");
    }
    return providerModel;
  }

  Future<List<ProviderModel>> getAllProvider(Function(String) onError) async {
    String endpoint = url;
    List<ProviderModel> listProvider = new List();
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> content = jsonRaw['content'];
        if (content.length > 0) {
          content.forEach((element) {
            listProvider.add(ProviderModel.fromMap(element));
          });
        }
      } catch (e) {
        onError("GetAllProvider: error in try catch");
        print(e);
      }
    } else {
      onError("GetAllProvider: error Status code ${response.statusCode}");
    }
    return listProvider;
  }
}
