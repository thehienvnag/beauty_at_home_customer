import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {

  final String city;
  const WeatherRequested({@required this.city}) : assert(city != null);
  @override
  // TODO: implement props
  List<Object> get props => [city];
}