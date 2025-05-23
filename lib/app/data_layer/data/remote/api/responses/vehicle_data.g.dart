// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleData _$VehicleDataFromJson(Map<String, dynamic> json) => VehicleData(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  image: json['image'] as String?,
  battery: (json['battery'] as num?)?.toInt(),
  location:
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
  costPerMinute: (json['cost_per_minute'] as num?)?.toDouble(),
);

Map<String, dynamic> _$VehicleDataToJson(VehicleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'status': instance.status,
      'image': instance.image,
      'battery': instance.battery,
      'location': instance.location,
      'cost_per_minute': instance.costPerMinute,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};
