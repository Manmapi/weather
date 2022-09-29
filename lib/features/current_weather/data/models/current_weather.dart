import 'package:json_annotation/json_annotation.dart';
import 'package:weather/features/current_weather/data/models/cloud.dart';
import 'package:weather/features/current_weather/data/models/coordinate.dart';
import 'package:weather/features/current_weather/data/models/rain.dart';
import 'package:weather/features/current_weather/data/models/snow.dart';
import 'package:weather/features/current_weather/data/models/sys.dart';
import 'package:weather/features/current_weather/data/models/weather_main.dart';
import 'package:weather/features/current_weather/data/models/weather_overall.dart';
import 'package:weather/features/current_weather/data/models/wind.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  final Coordinate coord;
  final List<WeatherOverall> weather;
  final String base;
  final WeatherMain main;
  final int visibility;
  final Wind wind;
  final Rain? rain;
  final Snow? snow;
  final Cloud? clouds;
  final int timezone;
  final int id;
  final String name;
  final int cod;
  final int dt;
  final Sys sys;
  CurrentWeather(
      {required this.coord,
      required this.weather,
      required this.base,
      required this.main,
      required this.visibility,
      required this.wind,
      required this.timezone,
      required this.id,
      required this.name,
      required this.dt,
      required this.cod,
      required this.sys,
      this.clouds,
      this.snow,
      this.rain});
  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
