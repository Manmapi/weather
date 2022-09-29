// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
      country: json['country'] as String?,
      id: json['id'] as int?,
      message: json['message'] as String?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'id': instance.id,
      'country': instance.country,
      'type': instance.type,
      'message': instance.message,
    };
