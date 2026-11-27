import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_companion/data/auth_provider.dart';

import '../services/auth/auth_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final baseUrl = dotenv.env['BASE_URL'] ?? 'https://reqres.in/api';
  final Duration duration = const Duration(seconds: 4);

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: duration,
      receiveTimeout: duration,
    ),
  );

  final authService = ref.read(authServiceProvider);
  dio.interceptors.add(AuthInterceptor(authService));

  return dio;
});
