import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_app/src/utils/api_constants.dart';

class SimpleAPI {
  static final String baseUrl = BASE_URL;
  static final String version = VERSION;
  static Future<List<T>> getAll<T>(
    String entityEndpoint, {
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
    Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint")
        .replace(queryParameters: queryParameters);
    // String endpoint = url;
    http.Response response = await http.get(uri, headers: headers);
    Map<String, dynamic> jsonRaw = json.decode(response.body);

    return (jsonRaw["content"] as List).map<T>((x) => fromJson(x)).toList();
  }

  static Future<dynamic> getById(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
    Map<String, String> queryParameters,
    Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint" + "/$id/")
        .replace(queryParameters: queryParameters);

    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return fromJson(jsonDecode(response.body));
    }
  }

  static Future<T> post<T>(
    String entityEndpoint, {
    dynamic body,
    Map<String, String> headers,
    Function(dynamic) fromJson,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint");
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 201) {
      log(response.body);
      return fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<AccountModel> login(dynamic body) async {
    final uri = Uri.parse(baseUrl + "/${EntityEndpoint.AUTH_LOGIN}");
    http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    log(response.body);
    if (response.statusCode == 200) {
      return AccountModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<bool> put(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
    dynamic body,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint/$id");
    http.Response response = await http.put(uri, headers: headers, body: body);
    if (response.statusCode == 204) {
      return true;
    }
  }

  static Future<bool> delete(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint/$id");
    http.Response response = await http.delete(uri, headers: headers);
    if (response.statusCode == 204) {
      return true;
    }
  }
}
