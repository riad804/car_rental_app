import 'package:car_rental_app/app/data_layer/data/remote/api/responses/api_response.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/profile_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'user_api.g.dart';


@RestApi(baseUrl: '/api')
@singleton
abstract class UserApi {
  @factoryMethod
  factory UserApi(@Named("Authorized") Dio dio) = _UserApi;

  @GET('/profile/{id}')
  Future<ApiResponse<ProfileData>> getProfile(@Path("id") String id);
}