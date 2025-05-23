import 'package:json_annotation/json_annotation.dart';

part 'vehicle_data.g.dart';

@JsonSerializable()
class VehicleData {
  final int? id;
  final String? name;
  final String? type;
  final String? status;
  final String? image;
  final int? battery;
  final Location? location;

  @JsonKey(name: 'cost_per_minute')
  final double? costPerMinute;

  VehicleData({
    this.id,
    this.name,
    this.type,
    this.status,
    this.image,
    this.battery,
    this.location,
    this.costPerMinute,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) =>
      _$VehicleDataFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDataToJson(this);
}

@JsonSerializable()
class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}