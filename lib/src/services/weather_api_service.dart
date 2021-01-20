import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'package:flutter_app/src/model.dart';

class WeatherApiService {
  static const BASE_URL = 'https://www.metaweather.com';
  final Client httpClient;

  WeatherApiService({@required this.httpClient});

  Future<int> getLocationId(String city) async {
    final locationUrl = '$BASE_URL/api/location/search/?query=$city';

    final res = await this.httpClient.get(locationUrl);
    if (res.statusCode != HttpStatus.ok) {
      throw Exception("Error getting locationId for city!");
    }
    final locationJson = jsonDecode(res.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$BASE_URL/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
