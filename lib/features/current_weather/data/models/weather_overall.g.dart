// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_overall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherOverall _$WeatherOverallFromJson(Map<String, dynamic> json) =>
    WeatherOverall(
      id: json['id'] as int,
      description: json['description'] as String,
      main: json['main'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherOverallToJson(WeatherOverall instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
