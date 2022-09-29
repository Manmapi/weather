import 'package:json_annotation/json_annotation.dart';

part 'weather_overall.g.dart';

@JsonSerializable()
class WeatherOverall {
  final int id;
  final String main;
  final String description;
  final String icon;
  WeatherOverall(
      {required this.id,
      required this.description,
      required this.main,
      required this.icon});

  factory WeatherOverall.fromJson(Map<String, dynamic> json) =>
      _$WeatherOverallFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherOverallToJson(this);
}
