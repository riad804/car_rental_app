import 'package:json_annotation/json_annotation.dart';

part 'profile_data.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)
class ProfileData {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: 'total_trips')
  final int totalTrips;

  ProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.totalTrips,
  });
  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}