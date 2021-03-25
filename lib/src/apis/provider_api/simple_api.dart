import 'dart:convert';
import 'dart:developer';

import 'package:flutter_app/src/models-new/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
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
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> jsonRaw = json.decode(response.body);

      return (jsonRaw["content"] as List).map<T>((x) => fromJson(x)).toList();
    }
    return null;
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
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    log(jsonEncode(body));
    log(response.body);
    if (response.statusCode == 201) {
      return fromJson(jsonDecode(response.body));
    }
    return null;
  }

  static Future<AccountModel> login(dynamic body) async {
    final uri = Uri.parse(baseUrl + "/${EntityEndpoint.AUTH_LOGIN}");
    log(jsonEncode(body));
    http.Response response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    log(response.body);
    if (response.statusCode == 200) {
      var account = AccountModel.fromJson(jsonDecode(response.body));

      return account;
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
    return false;
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
    return false;
  }

  static Future<FeedbackModel> postFeedback<FeedbackModel>(
    String entityEndpoint, {
    dynamic body,
    Map<String, String> headers,
    String rateScore,
    String bookingDetailId,
    String feedbackContent,
    String path,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint");
    var request = new http.MultipartRequest("POST", uri)
      ..fields['rateScore'] = rateScore
      ..fields['bookingDetailId'] = bookingDetailId
      ..fields['feedbackContent'] = feedbackContent
      ..files.add(await http.MultipartFile.fromPath("file", path,
          contentType: MediaType('application', 'x-tar')));

    request.send().then((value) => {
          if (value.statusCode == 201)
            {
              print('Insert success'),
            }
          else
            {
              print('Insert failed: ' + value.statusCode.toString()),
            }
        });
    return null;
  }

  static Future<AccountModel2> putAccountModel<AccountModel2>(
    String entityEndpoint, {
    dynamic body,
    Map<String, String> headers,
    String id,
    String displayName,
    String phone,
    String status,
    String path,
  }) async {
    final uri = Uri.parse(baseUrl + "/$entityEndpoint/$id");

    print('id nè : ' + id);
    print('name nè : ' + displayName);
    print('phone nè : ' + phone);
    print('stats nè : ' + status);
    if (path != null) {
      var request = new http.MultipartRequest("PUT", uri)
        ..fields['id'] = id
        ..fields['displayName'] = displayName
        ..fields['phone'] = phone
        ..fields['status'] = status
        ..files.add(await http.MultipartFile.fromPath("file", path,
            contentType: MediaType('application', 'x-tar')));
      request.send().then((value) => {
            if (value.statusCode == 204)
              {
                print('Update success'),
              }
            else
              {
                print('Update failed 1: ' + value.statusCode.toString()),
              }
          });
    } else {
      var request = new http.MultipartRequest("PUT", uri)
        ..fields['id'] = id
        ..fields['displayName'] = displayName
        ..fields['phone'] = phone
        ..fields['status'] = status;
      request.send().then((value) => {
            if (value.statusCode == 204)
              {
                print('Update success'),
              }
            else
              {
                print('Update failed 2: ' + value.statusCode.toString()),
              }
          });
    }

    return null;
  }
}
