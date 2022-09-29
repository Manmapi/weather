import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

@JsonSerializable()
class Rain {
  @JsonKey(name: '1h')
  final double oneHour;
  @JsonKey(name: '3h')
  final double? threeHour;
  Rain({required this.oneHour, this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}
