import 'package:car_rental_app/app/core/utils/type_defs.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/vehicle_api.dart';
import 'package:car_rental_app/app/data_layer/domain/repositories/vehicle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/failures.dart';

@Singleton(as: VehicleRepository)
class VehicleRepositoryImpl implements VehicleRepository {
  const VehicleRepositoryImpl(this._vehicleApi);

  final VehicleApi _vehicleApi;

  @override
  ResultFuture<VehicleData> getVehicleDetails({required String id}) async {
    try {
      final result = await _vehicleApi.vehicleDetails(id);
      if (result.status) {
        return right(result.data!);
      } else {
        return left(ServerFailure(error: result.message));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<VehicleData>> getVehicleList() async {
    try {
      final result = await _vehicleApi.vehicleList();
      if (result.status) {
        return right(result.data!);
      } else {
        return left(ServerFailure(error: result.message));
      }
    } on DioException catch (e) {
      return left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultVoid vehicleRent({required String id}) async {
    try {
      final result = await _vehicleApi.vehicleRent(id);
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