import 'dart:convert';

import 'package:flutter_app/src/models-new/api_list_model.dart';
import 'package:flutter_app/src/models-new/api_model.dart';
import 'package:flutter_app/src/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class SimpleAPI {
  static final String baseUrl = BASE_URL;

  static Future<ApiListModel<T>> getAll<T>(
    String entityEndpoint, {
    Map<String, String> queryParameters,
    Map<String, String> headers,
  }) async {
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
      return ApiListModel<T>.fromJson(jsonDecode(response.body));
    }
  }

  static Future<ApiModel<T>> getById<T>(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
  }) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/$id",
    );
    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return ApiModel<T>.fromJson(jsonDecode(response.body));
    }
  }

  // static Future<ApiModel<T>> postWithFile<T>(
  //     String entityEndpoint, {
  //       dynamic body,
  //       Map<String, String> headers,
  //       List<String> filePaths
  //     }) async {,,
  //   Uri uri = Uri.https(
  //     baseUrl,
  //     entityEndpoint,
  //   );
  //   http.MultipartRequest request = new http.MultipartRequest("POST", uri);
  //
  //   filePaths.forEach((element) => );
  //   http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
  //       'file', filePaths);
  //
  //   request.files.add(multipartFile);
  //
  //   http.Response response = await request.send();
  // }

  static Future<ApiModel<T>> post<T>(
    String entityEndpoint, {
    dynamic body,
    Map<String, String> headers,
  }) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint,
    );
    http.Response response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 201) {
      return ApiModel<T>.fromJson(jsonDecode(response.body));
    }
  }

  static Future<bool> put(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
    dynamic body,
  }) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/$id",
    );
    http.Response response = await http.put(uri, headers: headers, body: body);
    if (response.statusCode == 204) {
      return true;
    }
  }

  static Future<bool> delete(String entityEndpoint, String id,
      {Map<String, String> headers, dynamic body}) async {
    Uri uri = Uri.https(
      baseUrl,
      entityEndpoint + "/$id",
    );
    http.Response response = await http.put(uri, headers: headers, body: body);
    if (response.statusCode == 204) {
      return true;
    }
  }
}
