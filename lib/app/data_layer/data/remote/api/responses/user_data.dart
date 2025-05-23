import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)
class UserData {
  final int id;
  final String name;
  final String email;

  UserData({
    required this.id,
    required this.name,
    required this.email,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}