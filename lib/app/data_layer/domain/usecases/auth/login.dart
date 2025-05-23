import 'package:car_rental_app/app/core/utils/type_defs.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/use_cases.dart';
import '../../repositories/auth_repository.dart';

@Singleton()
class Login extends UseCaseWithParams<void, LoginParams> {
  @override
  ResultVoid call(LoginParams params) {
    Map<String, dynamic> body = {};
    body['email'] = params.email;
    body['password'] = params.password;
    return sl<AuthRepository>().login(body: body);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}