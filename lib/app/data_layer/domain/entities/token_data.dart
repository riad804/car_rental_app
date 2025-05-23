import 'package:equatable/equatable.dart';

class TokenData with EquatableMixin {
  final String accessToken;

  TokenData({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}