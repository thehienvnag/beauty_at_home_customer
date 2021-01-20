// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    Weather._mapStringToWeatherCondition(json['condition'] as String),
    json['formattedCondition'] as String,
    (json['minTemp'] as num)?.toDouble(),
    (json['temp'] as num)?.toDouble(),
    (json['maxTemp'] as num)?.toDouble(),
    json['locationId'] as int,
    json['created'] as String,
    json['lastUpdated'] == null
        ? null
        : DateTime.parse(json['lastUpdated'] as String),
    json['location'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'condition': _$WeatherConditionEnumMap[instance.condition],
      'formattedCondition': instance.formattedCondition,
      'minTemp': instance.minTemp,
      'temp': instance.temp,
      'maxTemp': instance.maxTemp,
      'locationId': instance.locationId,
      'created': instance.created,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'location': instance.location,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.snow: 'snow',
  WeatherCondition.sleet: 'sleet',
  WeatherCondition.hail: 'hail',
  WeatherCondition.thunderstorm: 'thunderstorm',
  WeatherCondition.heavyRain: 'heavyRain',
  WeatherCondition.lightRain: 'lightRain',
  WeatherCondition.showers: 'showers',
  WeatherCondition.heavyCloud: 'heavyCloud',
  WeatherCondition.lightCloud: 'lightCloud',
  WeatherCondition.clear: 'clear',
  WeatherCondition.unknown: 'unknown',
};
