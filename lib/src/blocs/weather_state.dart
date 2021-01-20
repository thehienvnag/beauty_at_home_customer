import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}
class WeatherLoadInProgress extends WeatherState {}
class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  WeatherLoadSuccess({@required this.weather}) : assert(weather != null);

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}
class WeatherLoadFailure extends WeatherState {}