import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final Duration duration = const Duration(seconds: 3);

  final dio = Dio(
    BaseOptions(
      connectTimeout: duration,
      receiveTimeout: duration,
      sendTimeout: duration,
    ),
  );


  //final authService = ref.read(authServiceProvider);

  //dio.interceptors.add(AuthInterceptor(authService));

  return dio;
});
