import 'package:flutter/foundation.dart';

@immutable
sealed class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([
    super.message = 'No internet connection. Please check your network.',
  ]);
}

class ServerException extends AppException {
  const ServerException([
    super.message =
    'Server is currently Undergoing maintenance. Please try again later',
  ]);
}

class UnknownException extends AppException {
  const UnknownException([
    super.message = 'Session expired. Please log in again.',
  ]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'An unexpected error occurred. Please try again.',
  ]);
}
