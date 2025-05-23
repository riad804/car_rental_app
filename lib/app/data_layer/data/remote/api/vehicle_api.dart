import 'package:car_rental_app/app/data_layer/data/remote/api/responses/api_response.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/vehicle_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'vehicle_api.g.dart';

@RestApi(baseUrl: '/api')
@singleton
abstract class VehicleApi {
  @factoryMethod
  factory VehicleApi(@Named("Authorized") Dio dio) = _VehicleApi;

  @GET('/vehicles')
  Future<ApiResponse<List<VehicleData>>> vehicleList();

  @GET('/vehicles/{id}')
  Future<ApiResponse<VehicleData>> vehicleDetails(@Path("id") String id);

  @POST('/vehicles/{id}/rent')
  Future<ApiResponse> vehicleRent(@Path("id") String id);
}