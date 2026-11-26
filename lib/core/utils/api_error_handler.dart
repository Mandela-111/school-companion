import 'dart:io';
import 'package:dio/dio.dart';
import 'package:school_companion/models/app_exception.dart';

class ApiErrorHandler {
  static AppException fromDioException(DioException error) {
    if (error.error is SocketException ||
        error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const NetworkException();
    }

    switch (error.type) {
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        if (statusCode == 401) {
          return const UnauthorizedException();
        } else if (statusCode != null && statusCode >= 500) {
          return const ServerException();
        }

        return UnknownException('Server error (${statusCode ?? 'unknown'})');

      default:
        return const NetworkException();
    }
  }
}