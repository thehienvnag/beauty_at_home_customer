import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/blocs/simple_bloc_observer.dart';
import 'package:flutter_app/src/repositories.dart';
import 'package:flutter_app/src/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/app.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiService: WeatherApiService(
      httpClient: http.Client(),
    ),
  );
  runApp(
    App(
      weatherRepository: weatherRepository,
    ),
  );
}
