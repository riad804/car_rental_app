
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/domain/repositories/pref_repository.dart';
import '../utils/environments.dart';
import 'interceptors/interceptor.api.dart';
import 'interceptors/interceptor.conn.dart';

var _baseUrl = Environments.appBaseUrl;
const _requestTimeOutInSeconds = Duration(seconds: 25);

@module
abstract class DioModule {
  @Named("Authorized")
  @singleton
  Dio getAuthorizedDioClient(PrefRepository prefRepository) {
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      AuthorizedRequestInterceptor(prefRepository),
      ConnectivityInterceptors(),
    ]);
    return dioClient;
  }

  @Named("Unauthorized")
  @singleton
  Dio getUnAuthorizedDioClient() {
    final dioClient = _dioClient();
    dioClient.interceptors.addAll([
      UnAuthorizedRequestInterceptor(),
      ConnectivityInterceptors(),
    ]);
    return dioClient;
  }

  Dio _dioClient() {
    final baseOptions = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: _requestTimeOutInSeconds,
      receiveTimeout: _requestTimeOutInSeconds,
    );
    return Dio(baseOptions);
  }
}
