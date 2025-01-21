import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioProvider {
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    dio.interceptors.add(providePretty());

    var token = 'Bearer ${dio.options.extra['token']}';
    dio.options.headers['Authorization'] = token;

    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePretty() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    );
  }
}
