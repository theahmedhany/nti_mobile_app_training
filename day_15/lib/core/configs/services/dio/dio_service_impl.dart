import 'package:day_14/core/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'dio_service.dart';

class DioServiceImpl implements DioService {
  late Dio _dio;

  DioServiceImpl() {
    _dio = Dio(BaseOptions(baseUrl: Api.baseUrl));
    if (kDebugMode) _dio.interceptors.add(LogInterceptor());
  }

  @override
  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      throw Exception('Failed to perform POST request: $e');
    }
  }
}
