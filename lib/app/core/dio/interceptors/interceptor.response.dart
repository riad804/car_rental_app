import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: "Please login again!",
      ));
    } else if (response.statusCode == 404) {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: "This request url does not exist!",
      ));
    } else if ((response.statusCode ?? 0) >= 500) {
      return handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: "Server error, please contact with support!",
      ));
    }
    super.onResponse(response, handler);
  }
}