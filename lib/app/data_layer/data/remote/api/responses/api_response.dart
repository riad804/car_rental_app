class ApiResponse<T> {
  final bool status;
  final String message;
  final T? data;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json)? fromJsonT,
      ) {
    return ApiResponse<T>(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: fromJsonT != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value)? toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': toJsonT != null && data != null ? toJsonT(data as T) : null,
    };
  }
}