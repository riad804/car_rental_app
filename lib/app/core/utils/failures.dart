import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({required this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.error});

  ServerFailure.fromException(DioException e) : this(error: e.error.toString());
}

class CacheFailure extends Failure {
  const CacheFailure({required super.error}) : super();

  CacheFailure.fromException(Exception e) : this(error: e.toString());
}
