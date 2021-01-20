import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/blocs/weather_event.dart';
import 'package:flutter_app/src/blocs/weather_state.dart';
import 'package:flutter_app/src/repositories.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if(event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try{
        final weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch(_){
        yield WeatherLoadFailure();
      }
    }
  }
}
