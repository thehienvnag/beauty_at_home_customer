import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/src/utils/api_constants.dart';
import 'package:http/http.dart' as http;

class SimpleAPI {
  static final String baseUrl = BASE_URL;
  static final String version = VERSION;
  static Future<List<T>> getAll<T>(
    String entityEndpoint, {
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
    Function(Map<String, dynamic>) fromMap,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint")
        .replace(queryParameters: queryParameters);
    // String endpoint = url;
    http.Response response = await http.get(uri, headers: headers);
    List<T> list = new List();
    dynamic jsonRaw = json.decode(response.body);
    List<dynamic> content = jsonRaw['content'];
    //List<T> content = jsonRaw['content'];
    if (content.length > 0) {
      content.forEach((element) {
        list.add(fromMap(element));
      });
    }
    return list;
  }

  static Future<dynamic> getById(
    String entityEndpoint,
    String id, {
    Map<String, String> headers,
    Map<String, String> queryParameters,
    Function(dynamic) fromJson,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint" + "/$id/")
        .replace(queryParameters: queryParameters);

    http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return fromJson(response.body);
    }
  }

  static Future<T> post<T>(
    String entityEndpoint, {
    dynamic body,
    Map<String, String> headers,
    Function(dynamic) fromJson,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint");
    http.Response response = await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 201) {
      return fromJson(jsonDecode(response.body));
    }
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
