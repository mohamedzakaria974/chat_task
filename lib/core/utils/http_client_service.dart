import 'dart:convert';

import 'package:chat_task/core/constants/api_consts.dart';
import 'package:chat_task/core/errors/app_exception.dart';
import 'package:dio/dio.dart';

class HttpClientService {
  final Dio _dio = Dio();

  // Configure base url or any other default settings here
  HttpClientService() {
    _dio.options.baseUrl = ApiConsts.kBaseUrl;
    _dio.options.contentType = Headers.jsonContentType;
    // Add other configurations like headers, timeouts etc.
  }

  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> post(String url, {dynamic data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // Add methods for other request types (PUT, DELETE, PATCH) following the same pattern
  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        final data = response.data;
        return data is String ? jsonDecode(data) : data;
      default:
        throw AppException(
            message: 'Unexpected status code: ${response.statusCode}');
    }
  }

  dynamic _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      throw const AppException(message: 'Connection timeout');
    } else if (error.type == DioExceptionType.unknown) {
      throw const AppException(message: 'Something went wrong');
    }
    return error.response?.data;
  }
}
