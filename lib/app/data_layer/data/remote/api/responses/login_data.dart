import 'package:car_rental_app/app/data_layer/data/remote/api/responses/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
  fieldRename: FieldRename.snake,
)
class LoginData {
  final String token;
  final UserData user;

  LoginData({
    required this.token,
    required this.user,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}