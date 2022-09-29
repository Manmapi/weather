import 'package:json_annotation/json_annotation.dart';

part 'weather_main.g.dart';

@JsonSerializable()
class WeatherMain {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double fellLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? groundLevel;
  WeatherMain(
      {required this.temp,
      required this.fellLike,
      required this.tempMax,
      required this.tempMin,
      required this.pressure,
      required this.humidity,
      required this.groundLevel,
      required this.seaLevel});

  factory WeatherMain.fromJson(Map<String, dynamic> json) =>
      _$WeatherMainFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherMainToJson(this);
}
