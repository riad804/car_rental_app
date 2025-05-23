// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:car_rental_app/app/core/dio/dio_module.dart' as _i1011;
import 'package:car_rental_app/app/data_layer/data/local/repository/pref_repo_impl.dart'
    as _i629;
import 'package:car_rental_app/app/data_layer/data/remote/api/auth_api.dart'
    as _i61;
import 'package:car_rental_app/app/data_layer/data/remote/api/user_api.dart'
    as _i530;
import 'package:car_rental_app/app/data_layer/data/remote/api/vehicle_api.dart'
    as _i426;
import 'package:car_rental_app/app/data_layer/data/remote/repositories/auth_repository_impl.dart'
    as _i941;
import 'package:car_rental_app/app/data_layer/data/remote/repositories/user_repository_impl.dart'
    as _i292;
import 'package:car_rental_app/app/data_layer/data/remote/repositories/vehicle_repository_impl.dart'
    as _i579;
import 'package:car_rental_app/app/data_layer/domain/repositories/auth_repository.dart'
    as _i336;
import 'package:car_rental_app/app/data_layer/domain/repositories/pref_repository.dart'
    as _i569;
import 'package:car_rental_app/app/data_layer/domain/repositories/user_repository.dart'
    as _i395;
import 'package:car_rental_app/app/data_layer/domain/repositories/vehicle_repository.dart'
    as _i515;
import 'package:car_rental_app/app/data_layer/domain/usecases/auth/login.dart'
    as _i883;
import 'package:car_rental_app/app/data_layer/domain/usecases/auth/register.dart'
    as _i164;
import 'package:car_rental_app/app/data_layer/domain/usecases/user/get_profile.dart'
    as _i144;
import 'package:car_rental_app/app/data_layer/domain/usecases/vehicle/get_vehicle_details.dart'
    as _i116;
import 'package:car_rental_app/app/data_layer/domain/usecases/vehicle/get_vehicle_list.dart'
    as _i501;
import 'package:car_rental_app/app/data_layer/domain/usecases/vehicle/vehicle_rent.dart'
    as _i724;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i883.Login>(() => _i883.Login());
    gh.singleton<_i164.Register>(() => _i164.Register());
    gh.singleton<_i144.GetProfile>(() => _i144.GetProfile());
    gh.singleton<_i116.GetVehicleDetails>(() => _i116.GetVehicleDetails());
    gh.singleton<_i501.GetVehicleList>(() => _i501.GetVehicleList());
    gh.singleton<_i724.VehicleRent>(() => _i724.VehicleRent());
    gh.singleton<_i569.PrefRepository>(() => const _i629.PrefRepoImpl());
    gh.singleton<_i361.Dio>(
      () => dioModule.getUnAuthorizedDioClient(),
      instanceName: 'Unauthorized',
    );
    gh.singleton<_i61.AuthApi>(
      () => _i61.AuthApi(gh<_i361.Dio>(instanceName: 'Unauthorized')),
    );
    gh.singleton<_i336.AuthRepository>(
      () => _i941.AuthRepositoryImpl(
        gh<_i61.AuthApi>(),
        gh<_i569.PrefRepository>(),
      ),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.getAuthorizedDioClient(gh<_i569.PrefRepository>()),
      instanceName: 'Authorized',
    );
    gh.singleton<_i530.UserApi>(
      () => _i530.UserApi(gh<_i361.Dio>(instanceName: 'Authorized')),
    );
    gh.singleton<_i426.VehicleApi>(
      () => _i426.VehicleApi(gh<_i361.Dio>(instanceName: 'Authorized')),
    );
    gh.singleton<_i395.UserRepository>(
      () => _i292.UserRepositoryImpl(gh<_i530.UserApi>()),
    );
    gh.singleton<_i515.VehicleRepository>(
      () => _i579.VehicleRepositoryImpl(gh<_i426.VehicleApi>()),
    );
    return this;
  }
}

class _$DioModule extends _i1011.DioModule {}
