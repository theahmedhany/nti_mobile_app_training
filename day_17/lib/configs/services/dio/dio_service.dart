import 'package:dio/dio.dart';

abstract class DioService {
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}
