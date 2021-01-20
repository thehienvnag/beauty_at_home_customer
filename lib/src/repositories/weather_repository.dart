import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/model.dart';
import 'package:flutter_app/src/services/weather_api_service.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;

  WeatherRepository({@required this.weatherApiService});

  Future<Weather> getWeather(String city) async{
    final int locationId = await weatherApiService.getLocationId(city);
    return await weatherApiService.fetchWeather(locationId);
  }
}