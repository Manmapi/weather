import 'package:json_annotation/json_annotation.dart';

part 'snow.g.dart';

@JsonSerializable()
class Snow {
  @JsonKey(name: '1h')
  final double oneHour;
  @JsonKey(name: '3h')
  final double? threeHour;
  Snow({required this.oneHour, this.threeHour});

  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);

  Map<String, dynamic> toJson() => _$SnowToJson(this);
}
