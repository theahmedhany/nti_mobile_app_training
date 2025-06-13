import 'dart:developer';

import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          queryParameters: {'apiKey': ApiConstants.apiKey},
        ),
      );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      log('Dio error: ${e.message}');
      rethrow;
    }
  }
}
