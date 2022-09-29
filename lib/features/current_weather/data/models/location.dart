import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  @JsonKey(name: 'local_names')
  final Map<String, String>? localNames;
  final double lat;
  final double lon;
  final String country;
  final String? state;
  Location(
      {required this.name,
      required this.country,
      required this.lat,
      required this.lon,
      this.localNames,
      this.state});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
