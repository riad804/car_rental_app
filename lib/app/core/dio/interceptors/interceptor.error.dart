import 'dart:convert';

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response != null) {
        try {
          final errorJson = json.decode(err.response.toString());
          return handler.reject(DioException(requestOptions: err.requestOptions, error: errorJson['message']));
        }catch (e) {
          try {
            final error = err.response?.data['message'];
            return handler.reject(DioException(requestOptions: err.requestOptions, error: error));
          } catch (e) {
            return getDioError(err, handler, e.toString());
          }
        }
      } else {
        return getDioError(err, handler, "Response not found!");
      }
    } else if (err.type == DioExceptionType.connectionTimeout) {
      return getDioError(err, handler, "Connection Time Out!");
    } else if (err.type == DioExceptionType.receiveTimeout) {
      return getDioError(err, handler, "Received Time Out!");
    } else if (err.type == DioExceptionType.cancel) {
      return getDioError(err, handler, "Request canceled!");
    } else if (err.type == DioExceptionType.sendTimeout) {
      return getDioError(err, handler, "Send Time Out!");
    } else if (err.type == DioExceptionType.badCertificate) {
      return getDioError(err, handler, "Bad certificate!");
    } else if (err.type == DioExceptionType.unknown) {
      return getDioError(err, handler, "Unable to Process your request!");
    }
    super.onError(err, handler);
  }

  void getDioError(DioException err, ErrorInterceptorHandler handler, String message) {
    return handler.reject(DioException(requestOptions: err.requestOptions, error: message));
  }
}