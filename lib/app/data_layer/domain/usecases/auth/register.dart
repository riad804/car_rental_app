
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/di/di_container.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../../core/utils/use_cases.dart';
import '../../repositories/auth_repository.dart';

@Singleton()
class Register extends UseCaseWithParams<void, RegisterParams> {
  @override
  ResultVoid call(RegisterParams params) {
    Map<String, dynamic> body = {};
    body['name'] = params.name;
    body['email'] = params.email;
    body['password'] = params.password;
    return sl<AuthRepository>().register(data: body);
  }
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}