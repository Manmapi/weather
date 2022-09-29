import 'package:json_annotation/json_annotation.dart';
part 'coordinate.g.dart';

@JsonSerializable()
class Coordinate {
  double lon;
  double lat;
  Coordinate(this.lat, this.lon);

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}
