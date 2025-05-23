import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/failures.dart';
import '../../../../core/utils/type_defs.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../../domain/repositories/pref_repository.dart';
import '../api/auth_api.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._authApi, this._prefRepository);

  final AuthApi _authApi;
  final PrefRepository _prefRepository;

  @override
  ResultVoid login({required dynamic body}) async {
    try {
      final result = await _authApi.login(body);
      if (result.status) {
        _prefRepository.setToken(result.data!.token);
        _prefRepository.setUserData(result.data!.user);
        return right(null);
      } else {
        return left(ServerFailure(error: result.message));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid register({required dynamic data}) async {
    try {
      final result = await _authApi.register(data);
      if (result.status) {
        return right(null);
      } else {
        return left(ServerFailure(error: result.message));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }
}