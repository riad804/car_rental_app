
import 'package:car_rental_app/app/core/utils/type_defs.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/profile_data.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/user_api.dart';
import 'package:car_rental_app/app/data_layer/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/failures.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._userApi);

  final UserApi _userApi;

  @override
  ResultFuture<ProfileData> getProfile({required String id}) async {
    try {
      final result = await _userApi.getProfile(id);
      if (result.status) {
        return right(result.data!);
      } else {
        return left(ServerFailure(error: result.message));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

}