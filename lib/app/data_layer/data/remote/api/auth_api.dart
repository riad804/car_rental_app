import 'package:car_rental_app/app/data_layer/data/remote/api/responses/api_response.dart';
import 'package:car_rental_app/app/data_layer/data/remote/api/responses/user_data.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'responses/login_data.dart';

part 'auth_api.g.dart';


@RestApi(baseUrl: '/auth')
@singleton
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(@Named("Unauthorized") Dio dio) = _AuthApi;

  @POST('/login')
  Future<ApiResponse<LoginData>> login(@Body() Map<String, dynamic> body);

  @POST('/register')
  Future<ApiResponse<UserData>> register(@Body() Map<String, dynamic> body);
}