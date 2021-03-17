import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/providers/account_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

abstract class IBaseModel {
  IBaseModel.fromJson(Map<String, dynamic> json);
}

class SimpleApi {
  final String entityEndpoint;
  final Function(IBaseModel) fromJson;
  static String baseUrl = "localhost:44397";

  SimpleApi({
    this.entityEndpoint,
    this.fromJson,
  });

  static Map<String, String> getAuthorizedHeader(
    BuildContext context,
    bool withIdToken,
  ) {
    final userProfile = context.read<AccountProvider>();
    if (withIdToken) {
      return {
        "Authorization": "Bearer ${userProfile?.accessToken}",
        "FirebaseIdToken": "Firebase ${userProfile?.idToken}",
      };
    } else {
      return {
        "Authorization": "Bearer ${userProfile?.accessToken}",
      };
    }
  }

  Future<List<IBaseModel>> getAll(
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  ) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint,
      queryParameters,
    );
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((m) => fromJson(m))
          .toList();
    }
    throw Exception('Fail to load ' + entityEndpoint);
  }

  Future<IBaseModel> getById(
    int id,
    Map<String, String> headers,
  ) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/${id.toString()}",
    );
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return fromJson(jsonDecode(response.body));
    }
    throw Exception('Fail to load $entityEndpoint with id: ${id.toString()}');
  }

  Future<IBaseModel> put(
    int id,
    dynamic requestBody,
    Map<String, String> headers,
  ) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/${id.toString()}",
    );
    http.Response response = await http.put(
      uri,
      headers: headers,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return fromJson(jsonDecode(response.body));
    }
    throw Exception('Fail to update $entityEndpoint with id: ${id.toString()}');
  }

  Future<bool> delete(
    int id,
    Map<String, String> headers,
  ) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/${id.toString()}",
    );
    http.Response response = await http.delete(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Fail to update $entityEndpoint with id: ${id.toString()}');
  }

  Future<bool> post(
    dynamic requestBody,
    Map<String, String> headers,
  ) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint,
    );
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw Exception('Fail to create $entityEndpoint');
  }
}
