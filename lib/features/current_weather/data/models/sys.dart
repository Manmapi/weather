import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

// check
@JsonSerializable()
class Sys {
  final int sunrise;
  final int sunset;
  final int? id;
  final String? country;
  final int? type;
  final String? message;
  Sys(
      {required this.sunrise,
      required this.sunset,
      this.country,
      this.id,
      this.message,
      this.type});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
