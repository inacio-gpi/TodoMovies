import 'package:dio/dio.dart';

import '../constants/api_routes.dart';
import 'http_interface.dart';
import 'http_logger_interceptor.dart';

class HttpClient implements IHttpClient {
  final Dio _client;

  HttpClient(this._client) {
    _client.options.baseUrl = ApiRoutes.baseUrl;
    _client.interceptors.add(HttpLoggerInterceptor());
  }

  Map<String, dynamic> _getParams(Map? params) {
    const String apiKey = String.fromEnvironment('API_KEY');
    final queryParams = params?.cast<String, dynamic>() ?? {}
      ..addAll({
        'api_key': apiKey,
      });
    queryParams.removeWhere((key, value) => (value == null || value == ''));

    return queryParams;
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.get(
        path,
        queryParameters: _getParams(queryParameters),
      );
      return response;
    } on DioError catch (error) {
      throw error.message;
    }
  }
}
