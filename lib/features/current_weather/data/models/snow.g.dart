// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snow _$SnowFromJson(Map<String, dynamic> json) => Snow(
      oneHour: (json['1h'] as num).toDouble(),
      threeHour: (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SnowToJson(Snow instance) => <String, dynamic>{
      '1h': instance.oneHour,
      '3h': instance.threeHour,
    };
