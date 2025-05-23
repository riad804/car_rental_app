import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class ConnectivityInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Connectivity connectivity = Connectivity();
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return handler.reject(DioException.connectionError(requestOptions: options, reason: "Connection", error: "No internet connection!"));
    }
    super.onRequest(options, handler);
  }
}