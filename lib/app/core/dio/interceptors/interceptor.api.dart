import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../data_layer/domain/entities/token_data.dart';
import '../../../data_layer/domain/repositories/pref_repository.dart';

const _baseHeaders = {
  'Content-Type': 'application/json',
  'charset': 'utf-8',
};

class UnAuthorizedRequestInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(_baseHeaders);
    log('${options.method} >>> ${options.uri}');
    log('Query parameters: ${options.queryParameters}');
    log('Request data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('${response.requestOptions.method} <<< ${response.requestOptions.uri}');
    log('Response data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('${err.requestOptions.method} <<< ${err.requestOptions.uri}');
    log('Error data: ${err.response?.data}');
    super.onError(err, handler);
  }
}


class AuthorizedRequestInterceptor extends UnAuthorizedRequestInterceptor {
  AuthorizedRequestInterceptor(this._prefRepository);
  final PrefRepository _prefRepository;

  TokenData get _token => _prefRepository.getToken();
  String get _accessToken => _token.accessToken;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      options.headers[HttpHeaders.authorizationHeader] = _accessToken;
      super.onRequest(options, handler);
    } on DioException catch (e) {
      handler.reject(e);
    } on Object catch (e) {
      log(e.toString());
    }
  }
}